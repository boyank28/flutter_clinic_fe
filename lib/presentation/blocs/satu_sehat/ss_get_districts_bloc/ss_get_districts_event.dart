part of 'ss_get_districts_bloc.dart';

@freezed
class SsGetDistrictsEvent with _$SsGetDistrictsEvent {
  const factory SsGetDistrictsEvent.doGet({required String cityCodes}) = _DoGet;
}
