import 'dart:io';

import 'package:ayana/core/error/failures.dart';
import 'package:ayana/features/home/data/models/banner_model.dart';
import 'package:ayana/features/home/domain/repositories/home_repository.dart';
import 'package:ayana/features/home/domain/usecases/get_banner.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/test_injection.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  group('Usecase test -', () {
    late GetBanner usecase;
    late MockHomeRepository mockHomeRepository;
    final httpResponse = File('test/fixtures/banner.json').readAsStringSync();
    final bannerModel = bannerModelFromJson(httpResponse);

    setUpAll(() {
      mockHomeRepository = MockHomeRepository();
      registerTestFactory<HomeRepository>(mockHomeRepository);
      usecase = GetBanner();
    });

    group('Get banner usecase -', () {
      test('success', () async {
        // Arrange
        when(
          () => mockHomeRepository.getBanner(),
        ).thenAnswer(
          (_) async => Right(bannerModel),
        );

        // Act
        var res = (await usecase.call()).fold((l) => l, (r) => r);

        // Assert
        expect(res, bannerModelFromJson(httpResponse));
      });

      test('failed', () async {
        // Arrange
        when(
          () => mockHomeRepository.getBanner(),
        ).thenAnswer(
          (_) async => const Left(NetworkFailure()),
        );

        // Act
        var res = (await usecase.call()).fold((l) => l, (r) => r);

        // Assert
        expect(res, const NetworkFailure());
      });
    });
  });
}
