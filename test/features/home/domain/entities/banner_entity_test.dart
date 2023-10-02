import 'dart:io';

import 'package:ayana/features/home/data/models/banner_model.dart';
import 'package:ayana/features/home/domain/entities/banner_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final httpResponse = File('test/fixtures/banner.json').readAsStringSync();

  final bannerModel = bannerModelFromJson(httpResponse);

  test('Same with banner model', () {
    expect(bannerModel, isA<BannerEntity>());
  });
}
