import 'dart:io';

class APIConstants {
  static const String baseUrl = 'https://fakestoreapi.com/ ';


  static const headerWithoutToken = {
    HttpHeaders.contentTypeHeader: 'application/json',
    HttpHeaders.acceptHeader: 'application/json'
  };
}
