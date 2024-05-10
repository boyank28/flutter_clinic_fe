part of 'ss_get_cities_bloc.dart';

@freezed
class SsGetCitiesEvent with _$SsGetCitiesEvent {
  const factory SsGetCitiesEvent.doGet({
    required String provinceCodes,
  }) = _DoGet;
}
