import 'package:ayana/core/di/service_locator.dart';
import 'package:ayana/core/error/failures.dart';
import 'package:ayana/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ayana/features/home/domain/entities/banner_entity.dart';
import 'package:ayana/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  static final dataSource = getIt<HomeRemoteDataSource>();

  @override
  Future<Either<Failure, BannerEntity>> getBanner() async {
    try {
      var res = await dataSource.getBanner();
      if (res == null) {
        return left(const NetworkFailure(message: 'NetworkFailure'));
      }
      return right(res);
    } catch (e) {
      return left(NetworkFailure(message: e.toString()));
    }
  }
}
