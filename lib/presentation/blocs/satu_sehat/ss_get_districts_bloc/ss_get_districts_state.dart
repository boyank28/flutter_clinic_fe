part of 'ss_get_districts_bloc.dart';

@freezed
class SsGetDistrictsState with _$SsGetDistrictsState {
  const factory SsGetDistrictsState.initial() = _Initial;
  const factory SsGetDistrictsState.loading() = _Loading;
  const factory SsGetDistrictsState.success({required List<Region> districts}) = _Success;
  const factory SsGetDistrictsState.failed({required String message}) = _Failed;
}
