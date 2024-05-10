part of 'get_doctors_bloc.dart';

@freezed
class GetDoctorsEvent with _$GetDoctorsEvent {
  const factory GetDoctorsEvent.getFirst({
    required String? name,
  }) = _GetFirst;

  const factory GetDoctorsEvent.getNext({
    required String? name,
  }) = _GetNext;
}
