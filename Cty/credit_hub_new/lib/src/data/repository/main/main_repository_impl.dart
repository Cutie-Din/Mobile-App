import 'package:credit_hub_new/src/shared/app_export.dart';

import 'main_repository.dart';

class MainRepositoryImpl implements MainRepository {
  final MainRepository repo;

  const MainRepositoryImpl({required this.repo});

  @override
  Future<BaseResponse> getDashboard() => repo.getDashboard();
}
