import 'package:flutter_task_zain/models/otherRegions_model.dart';
import 'package:flutter_task_zain/models/turkey_model.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  // 🔹 Turkey Packages List
  final List<TurkeyPackageModel> _turkeyPackages = [
    TurkeyPackageModel(
      id: "1",
      data: "3",
      validityDays: 30,
      price: 2.99,
    ),
    TurkeyPackageModel(
      id: "2",
      data: "5",
      validityDays: 7,
      price: 3.50,
    ),
    TurkeyPackageModel(
      id: "3",
      data: "5",
      validityDays: 15,
      price: 3.99,
    ),
    TurkeyPackageModel(
      id: "4",
      data: "5",
      validityDays: 30,
      price: 4.25,
    ),
    TurkeyPackageModel(
      id: "5",
      data: "10",
      validityDays: 10,
      price: 5.50,
    ),
    TurkeyPackageModel(
      id: "6",
      data: "10",
      validityDays: 15,
      price: 5.75,
    ),
    TurkeyPackageModel(
      id: "7",
      data: "20",
      validityDays: 30,
      price: 7.48,
    ),
    TurkeyPackageModel(
      id: "8",
      data: "Unlimited",
      validityDays: 10,
      price: 5.50,
    ),
  ];

  List<GlobalPackageModel> globalPackages = [
    GlobalPackageModel(
      id: "1",
      name: "EuroConnect",
      data: "1 GB",
      validityDays: 7,
      supportedCountries: 32,
      price: 2.51,
    ),
    GlobalPackageModel(
      id: "2",
      name: "Global Unlimited",
      data: "Unlimited",
      validityDays: 1,
      supportedCountries: 34,
      price: 2.99,
    ),
    GlobalPackageModel(
      id: "3",
      name: "EuroLink",
      data: "1 GB",
      validityDays: 7,
      supportedCountries: 34,
      price: 2.52,
    ),
    GlobalPackageModel(
      id: "4",
      name: "worldisyours",
      data: "1 GB",
      validityDays: 1,
      supportedCountries: 57,
      price: 3.00,
    ),
  ];

  // Public getter
  List<TurkeyPackageModel> get turkeyPackages => _turkeyPackages;
}
