class UpdateClinicServiceParams {
  final int id;
  final String name;
  final String category;
  final int price;
  final int qty;

  UpdateClinicServiceParams({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.qty,
  });
}
