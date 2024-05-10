part of 'ss_get_provinces_bloc.dart';

@freezed
class SsGetProvincesState with _$SsGetProvincesState {
  const factory SsGetProvincesState.initial() = _Initial;
  const factory SsGetProvincesState.loading() = _Loading;
  const factory SsGetProvincesState.success({required List<Region> provinces}) = _Success;
  const factory SsGetProvincesState.failed({required String message}) = _Failed;
}
