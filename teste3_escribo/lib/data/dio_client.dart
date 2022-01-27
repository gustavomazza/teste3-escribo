import 'package:dio/dio.dart';
import 'package:teste3_escribo/data/api.dart';

class DioClient {
  Future<Dio> getDioClient() async {
    final Dio _dio = Dio(kDioOptions);

    return _dio;
  }
}

class FetchDataException implements Exception {
  final _message;
  FetchDataException([this._message]);

  String toString() {
    if (_message == null) return "Exception";
    return _message;
  }
}
