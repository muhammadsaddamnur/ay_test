// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:ayana/core/di/service_locator.dart';
import 'package:ayana/core/error/failures.dart';
import 'package:ayana/features/home/domain/entities/banner_entity.dart';
import 'package:ayana/features/home/domain/usecases/get_banner.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@Injectable()
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  void getBanner() async {
    final banner = getIt<GetBanner>();
    var res = await banner.call();
    res.fold(
      (l) => emit(HomeState.failed(failure: l)),
      (r) {
        List<Data> bucketList = [];
        List<Data> kids = [];
        List<Data> wellness = [];
        List<Data> romantic = [];

        for (var element in r.data) {
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

        emit(
          HomeState.success(
            bucketList: bucketList,
            kids: kids,
            wellness: wellness,
            romantic: romantic,
          ),
        );
      },
    );
  }
}
