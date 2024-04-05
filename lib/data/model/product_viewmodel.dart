import 'package:flutter/widgets.dart';
import 'product.dart';

class ProductsVM extends ChangeNotifier {
  final List<ProductModel> items = [];

  // Add a new item to the list
  void add(ProductModel product) {
    items.add(product);
    notifyListeners();
  }

  // Remove an item at a specific index
  void remove(int index) {
    if (index >= 0 && index < items.length) {
      items.removeAt(index);
      notifyListeners();
    }
  }
}
