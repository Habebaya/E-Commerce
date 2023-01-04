import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Validators {
  late BuildContext context;

  Validators(BuildContext context) {this.context = context;
  }


  static bool responseIsValid(Response response) =>
      response.statusCode >= 200 && response.statusCode < 300;
  static bool responseIsNotValid(Response response) =>
      response.statusCode == 400;


}