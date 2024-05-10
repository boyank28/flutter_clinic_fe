part of 'ss_get_sub_districts_bloc.dart';

@freezed
class SsGetSubDistrictsState with _$SsGetSubDistrictsState {
  const factory SsGetSubDistrictsState.initial() = _Initial;
  const factory SsGetSubDistrictsState.loading() = _Loading;
  const factory SsGetSubDistrictsState.success({required List<Region> subDistricts}) = _Success;
  const factory SsGetSubDistrictsState.failed({required String message}) = _Failed;
}
