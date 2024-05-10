part of 'get_mr_by_reservation_id_bloc.dart';

@freezed
class GetMrByReservationIdEvent with _$GetMrByReservationIdEvent {
  const factory GetMrByReservationIdEvent.doGet({required int reservationId}) = _DoGet;
}
