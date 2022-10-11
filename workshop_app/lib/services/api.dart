import 'dart:developer';

import 'package:dio/dio.dart';

class Api {
  Api({required this.dio});
  final Dio dio;
  static const String url = '';

  sendDataApi({required dynamic params}) async {
    try {
      final response = await Dio().post(url, data: params);
      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
