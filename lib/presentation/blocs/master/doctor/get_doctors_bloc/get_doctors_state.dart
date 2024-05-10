part of 'get_doctors_bloc.dart';

@freezed
class GetDoctorsState with _$GetDoctorsState {
  const factory GetDoctorsState.initial() = _Initial;
  const factory GetDoctorsState.loading() = _Loading;
  const factory GetDoctorsState.success({
    required List<Doctor> doctors,
    required bool isNext,
  }) = _Success;
  const factory GetDoctorsState.failed({required String message}) = _Failed;
}
