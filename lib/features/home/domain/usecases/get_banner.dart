import 'package:ayana/core/di/service_locator.dart';
import 'package:ayana/core/error/failures.dart';
import 'package:ayana/features/home/domain/entities/banner_entity.dart';
import 'package:ayana/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetBanner {
  var repo = getIt<HomeRepository>();

  Future<Either<Failure, BannerEntity>> call() => repo.getBanner();
}
