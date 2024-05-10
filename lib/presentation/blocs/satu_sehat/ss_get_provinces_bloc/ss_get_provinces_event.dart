part of 'ss_get_provinces_bloc.dart';

@freezed
class SsGetProvincesEvent with _$SsGetProvincesEvent {
  const factory SsGetProvincesEvent.doGet({required String codes}) = _DoGet;
}
