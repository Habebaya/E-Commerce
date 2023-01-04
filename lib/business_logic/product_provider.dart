import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/data/repositories/product_repo.dart';
import 'package:flutter/foundation.dart';

import '../utility/validator.dart';

class ProductProvider with ChangeNotifier {
  final ProductRepository _productRepository =
      ProductRepository();


  Future<void> getAllProduct() async {
    try {
      final productsResponse =
      await _productRepository.getAllProducts();
      if (Validators.responseIsValid(productsResponse)) {
        final decoded = jsonDecode(productsResponse.body);
        print(decoded);

        List popularPerson = decoded['results'];
        for (var element in popularPerson) {
          // popularPersonList.add(PopularPerson.fromJson(element));
        }
      }


    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }


}
