part of 'get_patients_bloc.dart';

@freezed
class GetPatientsEvent with _$GetPatientsEvent {
  const factory GetPatientsEvent.getFirst({required String patient}) = _GetFirst;
  const factory GetPatientsEvent.getNext({required String patient}) = _GetNext;
}
