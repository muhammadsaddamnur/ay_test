import 'dart:io';

import 'package:ayana/core/error/failures.dart';
import 'package:ayana/features/home/data/models/banner_model.dart';
import 'package:ayana/features/home/domain/usecases/get_banner.dart';
import 'package:ayana/features/home/presentation/cubit/home_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helper/test_injection.dart';

class MockGetBanner extends Mock implements GetBanner {}

void main() {
  group('GetBanner bloc -', () {
    late MockGetBanner mockGetBanner;
    late HomeCubit cubit;

    setUp(() {
      mockGetBanner = MockGetBanner();
      registerTestFactory<GetBanner>(mockGetBanner);
      cubit = HomeCubit();
    });

    final httpResponse = File('test/fixtures/banner.json').readAsStringSync();
    final bannerModel = bannerModelFromJson(httpResponse);
    List<Data> bucketList = [];
    List<Data> kids = [];
    List<Data> wellness = [];
    List<Data> romantic = [];

    group('Get banner repository -', () {
      blocTest<HomeCubit, HomeState>(
        'submit emits HomeState.success when success',
        build: () {
          for (var element in bannerModel.data) {
            switch (element.tags?.first.toLowerCase()) {
              case 'bucket list':
                bucketList.add(element);
                break;
              case 'kids':
                kids.add(element);
                break;
              case 'wellness':
                wellness.add(element);
                break;
              case 'romantic':
                romantic.add(element);
                break;
              default:
            }
          }
          when(
            () => mockGetBanner.call(),
          ).thenAnswer(
            (_) async => Right(bannerModel),
          );

          return cubit;
        },
        act: (cubit) {
          cubit.getBanner();
        },
        expect: () => [
          HomeState.success(
            bucketList: bucketList,
            kids: kids,
            romantic: romantic,
            wellness: wellness,
          )
        ],
      );

      blocTest<HomeCubit, HomeState>(
        'submit emits HomeState.failed when failed',
        build: () {
          when(
            () => mockGetBanner.call(),
          ).thenAnswer(
            (_) async => const Left(NetworkFailure()),
          );

          return cubit;
        },
        act: (cubit) {
          cubit.getBanner();
        },
        expect: () => [const HomeState.failed(failure: NetworkFailure())],
      );
    });
  });
}
