class GlobalPackageModel {
  final String id;
  final String name;
  final String data;
  final int validityDays;
  final int supportedCountries;
  final double price;

  GlobalPackageModel({
    required this.id,
    required this.name,
    required this.data,
    required this.validityDays,
    required this.supportedCountries,
    required this.price,
  });
}
