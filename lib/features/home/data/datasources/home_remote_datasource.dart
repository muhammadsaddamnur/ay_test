import 'dart:convert';

import 'package:ayana/core/di/service_locator.dart';
import 'package:ayana/features/home/data/models/banner_model.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class HomeRemoteDataSource {
  Future<BannerModel?> getBanner();
}

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final client = getIt<Dio>();

  @override
  Future<BannerModel?> getBanner() async {
    var res = await client.get('api/v1/content/inspirations?location=Bali');
    return bannerModelFromJson(json.encode(res.data));
  }
}
