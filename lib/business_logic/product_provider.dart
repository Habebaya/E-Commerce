import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/data/repositories/product_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import '../data/models/product_model.dart';
import '../utility/validator.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository _productRepository = ProductRepository();
  List<Product> products = [];
  late Product product;
  List<Product> foundedProduct = [];

  Future<void> getAllProduct() async {
    try {
      final productsResponse = await _productRepository.getAllProducts();
      if (Validators.responseIsValid(productsResponse)) {
        final decoded = jsonDecode(productsResponse.body);
        print(decoded);

        List productList = decoded;
        for (var element in productList) {
          products.add(Product.fromJson(element));
        }
      }
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  Future<void> getSingleProduct(int id) async {
    Response response;
    try {
      response = await _productRepository.getSingleProduct(id);
      if (Validators.responseIsValid(response)) {
        final decoded = jsonDecode(response.body);

        final singleProduct = decoded;
        product = Product.fromJson(singleProduct);
        notifyListeners();
      }
    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }

  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
    } else {
      foundedProduct = products
          .where((value) =>
              value.title!.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
