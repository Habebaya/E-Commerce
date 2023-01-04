import 'dart:convert';
import 'dart:developer';

import 'package:ecommerce/data/repositories/product_repo.dart';
import 'package:flutter/foundation.dart';

import '../utility/validator.dart';

class PopularPersonProvider with ChangeNotifier {
  final ProductRepository _productRepository =
      ProductRepository();


  Future<void> getAllPopularPerson() async {
    try {
      final popularPersonResponse =
          await _productRepository.getAllProducts();

    } catch (e) {
      log(e.toString());
    }

    notifyListeners();
  }


}
