import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_coding/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_coding/data/network/base_api_services.dart';
import 'package:http/http.dart ' as http;

class NetworkServicesApi implements BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 50));
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time Out Try Again');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var data) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(Duration(seconds: 50));
      jsonResponse = returnResponse(response);

      if (response.statusCode == 200) {}
    } on SocketException {
      throw NoInternetException('');
    } on TimeoutException {
      throw FetchDataException('Time Out Try Again');
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 401:
        throw UnauthorisedException();
      case 500:
        throw FetchDataException(
            'Error Communicated with server${response.statusCode}');
      default:
        throw FetchDataException('Something Went Wrong${response.statusCode}');
    }
  }
}
