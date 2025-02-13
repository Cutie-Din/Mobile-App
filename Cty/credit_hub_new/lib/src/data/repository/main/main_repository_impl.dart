import 'package:credit_hub_new/src/shared/app_export.dart';

import 'main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final MainRepository repo;

  const MainRepositoryImpl({required this.repo});

  @override
  Future<BaseResponse> getDashboard() => repo.getDashboard();

  @override
  Future<BaseResponse> postHistory({required HistoryModel param}) => repo.postHistory(param: param);

  @override
  Future<BaseResponse> postAdd({required AddModel param}) => repo.postAdd(param: param);

  @override
  Future<BaseResponse> postAddImage({required AddImageModel param}) =>
      repo.postAddImage(param: param);
}
