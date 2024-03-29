import 'package:admin_dashboard/services/local_storage.dart';
import 'package:dio/dio.dart';

class ApiCafe {
  static Dio _dio = Dio();

  static void configureDio() {
    _dio.options.baseUrl = "http://localhost:8080/api";

    _dio.options.headers = {
      'x-token': LocalStorenge.pref.getString('token') ?? '',
    };
  }

  static Future httpGet(String path) async {
    try {
      final resp = await _dio.get(path);

      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el Get');
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);
    try {
      final resp = await _dio.post(path, data: formData);

      return resp.data;
    } catch (e) {
      print(e);
      throw ('Error en el Post');
    }
  }
}
