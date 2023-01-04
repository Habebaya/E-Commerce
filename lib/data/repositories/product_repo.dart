import 'dart:developer';

import 'package:http/http.dart';

import '../../constant/api.dart';
import '../../service/network_service.dart';

class ProductRepository {
  final NetworkService _networkService = NetworkService();

  Future<Response> getAllPopularPerson(int page) async {
    const url = '${APIConstants.baseUrl}${APIConstants.productPERFIX}';

    late Response response;
    try {
      response = await _networkService.get(url,
          headers: APIConstants.headerWithoutToken);
    } catch (e) {
      log(e.toString());
    }

    return response;
  }
}
