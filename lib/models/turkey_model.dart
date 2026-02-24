class TurkeyPackageModel {
  final String id;
  final String data;
  final int validityDays;
  final double price;
  int quantity;

  TurkeyPackageModel({
    required this.id,
    required this.data,
    required this.validityDays,
    required this.price,
    this.quantity = 0,
  });
}
