import 'package:flutter_task_zain/app/app.bottomsheets.dart';
import 'package:flutter_task_zain/models/otherRegions_model.dart';
import 'package:flutter_task_zain/models/turkey_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter_task_zain/app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  // 🔹 Cart items
  final List<dynamic> _cartItems = [];
  List<dynamic> get cartItems => _cartItems;

  // 🔹 Turkey Packages List
  final List<TurkeyPackageModel> _turkeyPackages = [
    TurkeyPackageModel(
      id: "turkey_1",
      data: "3",
      validityDays: 30,
      price: 2.99,
      quantity: 0,
    ),
    TurkeyPackageModel(
      id: "turkey_2",
      data: "5",
      validityDays: 7,
      price: 3.50,
      quantity: 0,
    ),
    TurkeyPackageModel(
      id: "turkey_3",
      data: "5",
      validityDays: 15,
      price: 3.99,
      quantity: 0,
    ),
    TurkeyPackageModel(
      id: "turkey_4",
      data: "5",
      validityDays: 30,
      price: 4.25,
      quantity: 0,
    ),
    TurkeyPackageModel(
      id: "turkey_5",
      data: "10",
      validityDays: 10,
      price: 5.50,
      quantity: 0,
    ),
    TurkeyPackageModel(
      id: "turkey_6",
      data: "10",
      validityDays: 15,
      price: 5.75,
      quantity: 0,
    ),
    TurkeyPackageModel(
      id: "turkey_7",
      data: "20",
      validityDays: 30,
      price: 7.48,
      quantity: 0,
    ),
    TurkeyPackageModel(
      id: "turkey_8",
      data: "Unlimited",
      validityDays: 10,
      price: 5.50,
      quantity: 0,
    ),
  ];

  final List<GlobalPackageModel> _globalPackages = [
    GlobalPackageModel(
      id: "global_1",
      name: "EuroConnect",
      data: "1 GB",
      validityDays: 7,
      supportedCountries: 32,
      price: 2.51,
      quantity: 0,
    ),
    GlobalPackageModel(
      id: "global_2",
      name: "Global Unlimited",
      data: "Unlimited",
      validityDays: 1,
      supportedCountries: 34,
      price: 2.99,
      quantity: 0,
    ),
    GlobalPackageModel(
      id: "global_3",
      name: "EuroLink",
      data: "1 GB",
      validityDays: 7,
      supportedCountries: 34,
      price: 2.52,
      quantity: 0,
    ),
    GlobalPackageModel(
      id: "global_4",
      name: "worldisyours",
      data: "1 GB",
      validityDays: 1,
      supportedCountries: 57,
      price: 3.00,
      quantity: 0,
    ),
  ];

  // Public getters
  List<TurkeyPackageModel> get turkeyPackages => _turkeyPackages;
  List<GlobalPackageModel> get globalPackages => _globalPackages;

  // 🔹 Calculate total price of cart items
  double get cartTotal {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price * (item.quantity > 0 ? item.quantity : 1);
    }
    return total;
  }

  // 🔹 Handle Turkey package tap
  void onTurkeyPackageTap(TurkeyPackageModel package) {
    _addToCart(package);
    _showCartBottomSheet();
  }

  // 🔹 Handle Global package tap
  void onGlobalPackageTap(GlobalPackageModel package) {
    _addToCart(package);
    _showCartBottomSheet();
  }

  // 🔹 Add package to cart or increment quantity if exists
  void _addToCart(dynamic package) {
    try {
      final existingItem = _cartItems.firstWhere(
        (item) => item.id == package.id,
      );
      existingItem.quantity = (existingItem.quantity ?? 0) + 1;
    } catch (e) {
      final newItem = package is TurkeyPackageModel
          ? TurkeyPackageModel(
              id: package.id,
              data: package.data,
              validityDays: package.validityDays,
              price: package.price,
              quantity: 1,
            )
          : GlobalPackageModel(
              id: package.id,
              name: package.name,
              data: package.data,
              validityDays: package.validityDays,
              supportedCountries: package.supportedCountries,
              price: package.price,
              quantity: 1,
            );
      _cartItems.add(newItem);
    }
    notifyListeners();
  }

  // ✅ Called by bottom sheet when user taps ✕ — syncs removal back to HomeViewModel
  void onItemRemovedFromSheet(dynamic item) {
    _cartItems.removeWhere((i) => i.id == item.id);
    notifyListeners(); // triggers gradient border to disappear
  }

  // 🔹 Show cart bottom sheet
  void _showCartBottomSheet() async {
    final result = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.cartBottom,
      title: 'Your Cart',
      description: 'Selected packages',
      data: {
        'cartItems': _cartItems,
        'onRemove': onItemRemovedFromSheet, // ✅ Pass callback to sheet
      },
    );

    if (result?.confirmed ?? false) {
      _handleCheckout(result?.data);
    }

    // ✅ Always notify after sheet closes so border state is in sync
    notifyListeners();
  }

  // 🔹 Handle checkout
  void _handleCheckout(dynamic totalAmount) {
    _cartItems.clear();
    notifyListeners();
  }

  // 🔹 Update package quantity
  void updateQuantity(dynamic package, int newQuantity) {
    final index = _cartItems.indexWhere((item) => item.id == package.id);
    if (index != -1) {
      if (newQuantity <= 0) {
        _cartItems.removeAt(index);
      } else {
        _cartItems[index].quantity = newQuantity;
      }
      notifyListeners();
    }
  }

  // 🔹 Remove package from cart
  void removeFromCart(dynamic package) {
    _cartItems.removeWhere((item) => item.id == package.id);
    notifyListeners();
  }

  // 🔹 Clear entire cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
