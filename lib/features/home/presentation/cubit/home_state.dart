part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.success({
    @Default([]) List<Data> bucketList,
    @Default([]) List<Data> kids,
    @Default([]) List<Data> wellness,
    @Default([]) List<Data> romantic,
  }) = _Success;
  const factory HomeState.failed({required Failure failure}) = _Fail;
}
