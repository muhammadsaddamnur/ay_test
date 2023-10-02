// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ayana/core/di/register_module.dart' as _i9;
import 'package:ayana/features/home/data/datasources/home_remote_datasource.dart'
    as _i6;
import 'package:ayana/features/home/data/repositories/home_repository_impl.dart'
    as _i8;
import 'package:ayana/features/home/domain/repositories/home_repository.dart'
    as _i7;
import 'package:ayana/features/home/domain/usecases/get_banner.dart' as _i4;
import 'package:ayana/features/home/presentation/cubit/home_cubit.dart' as _i5;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.Dio>(() => registerModule.dio);
  gh.factory<_i4.GetBanner>(() => _i4.GetBanner());
  gh.factory<_i5.HomeCubit>(() => _i5.HomeCubit());
  gh.lazySingleton<_i6.HomeRemoteDataSource>(
      () => _i6.HomeRemoteDataSourceImpl());
  gh.lazySingleton<_i7.HomeRepository>(() => _i8.HomeRepositoryImpl());
  return getIt;
}

class _$RegisterModule extends _i9.RegisterModule {}
