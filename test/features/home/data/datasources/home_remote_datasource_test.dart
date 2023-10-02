import 'dart:convert';
import 'dart:io';

import 'package:ayana/features/home/data/datasources/home_remote_datasource.dart';
import 'package:ayana/features/home/data/models/banner_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/test_injection.dart';

class MockDio extends Mock implements Dio {}

void main() {
  group('HomeRemoteDataSourceImpl test -', () {
    late HomeRemoteDataSourceImpl dataSource;
    late MockDio mockDio;

    setUpAll(() {
      mockDio = MockDio();
      registerTestFactory<Dio>(mockDio);
      dataSource = HomeRemoteDataSourceImpl();
    });

    final httpResponse = File('test/fixtures/banner.json').readAsStringSync();

    group('Get banner -', () {
      test('success', () async {
        // Arrange
        when(
          () => mockDio.get('api/v1/content/inspirations?location=Bali'),
        ).thenAnswer(
          (_) async => Response(
            data: json.decode(httpResponse),
            requestOptions: RequestOptions(),
          ),
        );

        // Act
        var res = await dataSource.getBanner();

        // Assert
        expect(res, bannerModelFromJson(httpResponse));
      });
    });
  });
}
