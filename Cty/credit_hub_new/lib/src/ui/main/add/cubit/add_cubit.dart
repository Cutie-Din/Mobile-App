import 'dart:io';

import 'package:credit_hub_new/src/ui/main/add/cubit/add_image_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:credit_hub_new/src/shared/app_export.dart';

import 'add_state.dart';

final logger = getLogger("AddCubit");

class AddCubit extends Cubit<AddState> {
  final MainRepository repo;
  final AppManager appManager;

  AddCubit(this.repo, this.appManager) : super(const AddState());

  Future<void> postAdd(
      {required String lot_no, required double money_request, required String image_link}) async {
    try {
      emit(state.copyWith(status: AddStatus.loading));

      AddModel addModel =
          AddModel(lot_no: lot_no, money_request: money_request, image_link: image_link);
      final response = await repo.postAdd(param: addModel);

      logger.d('response: ${response.toJson((data) => data)}');

      if (response.code == '200') {
        emit(state.copyWith(status: AddStatus.success));
      } else {
        emit(state.copyWith(
          status: AddStatus.failure,
          message: response.error ?? 'Unknown error',
        ));
      }
    } catch (e) {
      emit(state.copyWith(status: AddStatus.failure, message: e.toString()));
    }
  }
}

class AddImageCubit extends Cubit<AddImageState> {
  final MainRepository repo;
  final AppManager appManager;

  AddImageCubit(this.repo, this.appManager) : super(const AddImageState());
  Future<void> postAddImage({required XFile imageFile}) async {
    try {
      emit(state.copyWith(status: AddImageStatus.loading));

      final response = await NetworkManager().createDio().uploadImage(imageFile);

      if (response.statusCode == 200) {
        final String imageUrl = response.data['data'][0]['url'] ?? '';
        logger.d('${imageUrl}');
        if (imageUrl.isNotEmpty) {
          emit(state.copyWith(
            status: AddImageStatus.success,
            data: AddImageModel(url: imageUrl),
          ));
          return;
        }
      }

      emit(state.copyWith(status: AddImageStatus.failure, message: "Upload failed"));
    } catch (e) {
      emit(state.copyWith(status: AddImageStatus.failure, message: e.toString()));
    }
  }
}
