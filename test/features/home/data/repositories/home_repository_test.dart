import 'dart:io';

import 'package:ayana/core/error/failures.dart';
import 'package:ayana/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ayana/features/home/data/models/banner_model.dart';
import 'package:ayana/features/home/data/repositories/home_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/test_injection.dart';

class MockHomeRemoteDataSource extends Mock implements HomeRemoteDataSource {}

void main() {
  group('HomeRepositoryImpl tests -', () {
    late MockHomeRemoteDataSource mockHomeRemoteDataSource;
    late HomeRepositoryImpl repo;

    setUpAll(() {
      mockHomeRemoteDataSource = MockHomeRemoteDataSource();
      registerTestFactory<HomeRemoteDataSource>(mockHomeRemoteDataSource);
      repo = HomeRepositoryImpl();
    });

    final httpResponse = File('test/fixtures/banner.json').readAsStringSync();

    var bannerModel = bannerModelFromJson(httpResponse);

    group('Get banner repository -', () {
      test('success', () async {
        // Arrange
        when(
          () => mockHomeRemoteDataSource.getBanner(),
        ).thenAnswer(
          (_) async => bannerModel,
        );

        // Act
        var res = (await repo.getBanner()).fold((l) => l, (r) => r);

        // Assert
        expect(res, bannerModelFromJson(httpResponse));
      });

      test('failed', () async {
        // Arrange
        when(
          () => mockHomeRemoteDataSource.getBanner(),
        ).thenAnswer(
          (_) async => null,
        );

        // Act
        var res = (await repo.getBanner()).fold((l) => l, (r) => r);

        // Assert
        expect(res, const NetworkFailure(message: 'NetworkFailure'));
      });
    });
  });
}
