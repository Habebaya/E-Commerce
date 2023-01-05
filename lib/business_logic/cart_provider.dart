import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../data/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<Product> cartProducts = [];

  Future<void> addToCart(Product product)  async {
    try {
      cartProducts.add(product);
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> removeFromCart(Product product)  async {
    try {
      print(cartProducts.length);

      cartProducts.remove(product);
      print(cartProducts.length);
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }
}
