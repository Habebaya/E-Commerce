import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../data/models/product_model.dart';

class SettingsProvider with ChangeNotifier {
  bool themeBool = false;

  ThemeData lightTheme =
      ThemeData(primarySwatch: Colors.amber,
          brightness: Brightness.light,);
  ThemeData darkTheme =
      ThemeData(primarySwatch: Colors.red,
          brightness: Brightness.dark);

 void changeTheme() {
    themeBool = !themeBool;
    notifyListeners();
  }
}
