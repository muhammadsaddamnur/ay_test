import 'package:ayana/core/error/failures.dart';
import 'package:ayana/features/home/domain/entities/banner_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, BannerEntity>> getBanner();
}
