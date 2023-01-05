import 'dart:developer';

import 'package:flutter/foundation.dart';

import '../data/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<Product> cartProducts = [];
   double totalPrice = 0;
  late Product product;

  Future<void> addToCart(product)  async {
    try {
      cartProducts.add(product);
      totalPrice = totalPrice +  product.price!;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> removeFromCart( product)  async {
    try {
      print(cartProducts.length);

      cartProducts.remove(product);
      totalPrice = totalPrice-product.price!;
      print(cartProducts.length);
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  void addTotalPrice(double productPrice) {
    totalPrice = totalPrice + productPrice;
    notifyListeners();
  }
}
