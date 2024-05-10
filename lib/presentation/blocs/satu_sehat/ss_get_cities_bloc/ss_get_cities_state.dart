part of 'ss_get_cities_bloc.dart';

@freezed
class SsGetCitiesState with _$SsGetCitiesState {
  const factory SsGetCitiesState.initial() = _Initial;
  const factory SsGetCitiesState.loading() = _Loading;
  const factory SsGetCitiesState.success({required List<Region> cities}) = _Success;
  const factory SsGetCitiesState.failed({required String message}) = _Failed;
}
