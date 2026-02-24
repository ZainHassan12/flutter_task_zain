class RegionalPackageModel {
  final String id;
  final String title;
  final String data;
  final int validityDays;
  final int supportedCountries;
  final double price;
  int quantity;

  RegionalPackageModel({
    required this.id,
    required this.title,
    required this.data,
    required this.validityDays,
    required this.supportedCountries,
    required this.price,
    this.quantity = 0,
  });
}
