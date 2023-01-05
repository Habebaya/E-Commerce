import 'dart:async';
import 'package:http/http.dart' as http;



class NetworkService {
  Future<http.Response> get(String apiUrlString, {dynamic headers}) async {
    print("Network $apiUrlString");
    final apiUrl = Uri.parse(apiUrlString);
    http.Response response = await http
        .get(apiUrl, headers: headers);
    return response;
  }
}