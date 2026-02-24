import 'package:flutter_task_zain/models/otherRegions_model.dart';
import 'package:flutter_task_zain/models/turkey_model.dart';
import 'package:stacked/stacked.dart';

class CartBottomSheetViewModel extends BaseViewModel {
  List<dynamic> _items = [];
  List<dynamic> get items => _items;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  Function(dynamic)? _onRemove;

  void initialize(List<dynamic> cartItems, Function(dynamic) onRemove) {
    // ✅ Deep copy so this list is independent from HomeViewModel's list
    _items = cartItems.map((item) {
      if (item is TurkeyPackageModel) {
        return TurkeyPackageModel(
          id: item.id,
          data: item.data,
          validityDays: item.validityDays,
          price: item.price,
          quantity: item.quantity,
        );
      } else if (item is GlobalPackageModel) {
        return GlobalPackageModel(
          id: item.id,
          name: item.name,
          data: item.data,
          validityDays: item.validityDays,
          supportedCountries: item.supportedCountries,
          price: item.price,
          quantity: item.quantity,
        );
      }
      return item;
    }).toList();

    _onRemove = onRemove;
    _calculateTotal();
    notifyListeners();
  }

  void _calculateTotal() {
    _totalPrice = 0;
    for (var item in _items) {
      _totalPrice += item.price * (item.quantity ?? 1);
    }
  }

  void increaseQuantity(dynamic item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      // ✅ Assign new quantity value to trigger change detection
      _items[index].quantity = (_items[index].quantity ?? 1) + 1;
      _calculateTotal();
      notifyListeners();
    }
  }

  void decreaseQuantity(dynamic item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      final currentQty = _items[index].quantity ?? 1;
      if (currentQty > 1) {
        _items[index].quantity = currentQty - 1;
        _calculateTotal();
        notifyListeners();
      } else {
        // Quantity hits 0 — remove item
        final removedItem = _items[index];
        _items.removeAt(index);
        _onRemove?.call(removedItem); // ✅ Sync removal to HomeViewModel
        _calculateTotal();
        notifyListeners();
      }
    }
  }

  void removeItem(dynamic item) {
    _items.removeWhere((i) => i.id == item.id);
    _onRemove?.call(item); // ✅ Sync removal to HomeViewModel
    _calculateTotal();
    notifyListeners();
  }

  String getItemDescription(dynamic item) {
    if (item is TurkeyPackageModel) {
      return "${item.data} GB / ${item.validityDays} Days";
    } else if (item is GlobalPackageModel) {
      return "${item.data} / ${item.validityDays} Days • ${item.supportedCountries} countries";
    }
    return "";
  }

  String getItemName(dynamic item) {
    if (item is TurkeyPackageModel) {
      return "${item.data} GB";
    } else if (item is GlobalPackageModel) {
      return item.name;
    }
    return "";
  }
}
