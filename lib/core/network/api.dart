import 'package:dio/dio.dart';
import '../error/exceptions.dart';

class Api {
  const Api._();
  factory Api() => _instance;

  static const Api _instance = Api._();
  static final Dio _dio = Dio();

  Future<dynamic> get({required String url}) async {
    Response response = await _dio.get(url);

    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(errorModel: response.data);
    }
  }
}
