import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  Api({required this.dio});
  final Dio dio;

  sendDataApi({required String url}) async {
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
