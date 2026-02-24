import 'package:flutter_task_zain/models/otherRegions_model.dart';
import 'package:flutter_task_zain/models/turkey_model.dart';
import 'package:flutter_task_zain/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';

class CartBottomSheetViewModel extends BaseViewModel {
  List<dynamic> _items = [];
  List<dynamic> get items => _items;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  // ✅ Callback to notify HomeViewModel when an item is removed
  Function(dynamic)? _onRemove;

  void initialize(List<dynamic> cartItems, Function(dynamic) onRemove) {
    _items = cartItems;
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
      if (_items[index].quantity == null) {
        _items[index].quantity = 1;
      }
      _items[index].quantity++;
      _calculateTotal();
      notifyListeners();
    }
  }

  void decreaseQuantity(dynamic item) {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) {
      if (_items[index].quantity == null) {
        _items[index].quantity = 1;
      }
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        // ✅ Also notify HomeViewModel when quantity hits 0
        _onRemove?.call(_items[index]);
        _items.removeAt(index);
      }
      _calculateTotal();
      notifyListeners();
    }
  }

  // ✅ Remove item and sync back to HomeViewModel via callback
  void removeItem(dynamic item) {
    _items.removeWhere((i) => i.id == item.id);
    _onRemove?.call(item); // 🔑 This updates HomeViewModel so border disappears
    _calculateTotal();
    notifyListeners();
  }

  String getItemDescription(dynamic item) {
    if (item is TurkeyPackageModel) {
      return "${item.data} $gbUnit / ${item.validityDays} Days";
    } else if (item is GlobalPackageModel) {
      return "${item.data} / ${item.validityDays} Days • ${item.supportedCountries} countries";
    }
    return "";
  }

  String getItemName(dynamic item) {
    if (item is TurkeyPackageModel) {
      return "${item.data} $gbUnit";
    } else if (item is GlobalPackageModel) {
      return item.name;
    }
    return "";
  }
}
