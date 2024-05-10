part of 'ss_get_sub_districts_bloc.dart';

@freezed
class SsGetSubDistrictsEvent with _$SsGetSubDistrictsEvent {
  const factory SsGetSubDistrictsEvent.doGet({required String districtCodes}) = _DoGet;
}
