import 'package:ayana/core/di/env.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  Dio get dio => Dio(
        BaseOptions(
          baseUrl: Env.baseUrl,
        ),
      );
}
