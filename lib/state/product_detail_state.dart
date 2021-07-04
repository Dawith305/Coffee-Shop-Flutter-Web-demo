import 'package:cofeeshop/models/option.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProductDetailState with ChangeNotifier, DiagnosticableTreeMixin {
  int _quantity = 1;
  int _extraCost = 0;
  bool _isAddToCartButtDisabled = false;

  int get extraCost => _extraCost;

  set extraCost(int value) {
    _extraCost = value;
    notifyListeners();
  }

  int get quantity => _quantity;

  set quantity(int value) {
    _quantity = value;
    notifyListeners();
  }


  bool get isAddToCartButtDisabled => _isAddToCartButtDisabled;

  set isAddToCartButtDisabled(bool value) {
    _isAddToCartButtDisabled = value;
      notifyListeners();
  }

  void toggleCartButton(){
    _isAddToCartButtDisabled = !_isAddToCartButtDisabled;
    notifyListeners();
  }

  void addQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (_quantity >= 2) {
      _quantity--;
      notifyListeners();
    }
  }

  void reset() {
    _quantity = 1;
    _extraCost = 0;
    _isAddToCartButtDisabled = false;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('quantity', quantity));
  }
}
