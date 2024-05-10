class CreatePaymentParams {
  final int patientReservationId;
  final String paymentMethod;
  final int totalPrice;

  CreatePaymentParams({
    required this.patientReservationId,
    required this.paymentMethod,
    required this.totalPrice,
  });
}
