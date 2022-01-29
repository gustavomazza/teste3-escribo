import 'package:dio/dio.dart';
import 'package:teste3_escribo/data/dio_client.dart';

class FilmeApiClient {
  final DioClient _dioClient = DioClient();

  Future<Map<String, dynamic>> listarFilmes() async {
    final Dio _dio = await _dioClient.getDioClient();

    try {
      final response = await _dio.get('/films');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw FetchDataException('Falha ao consultar filmes.');
      }
    } on DioError catch (e) {
      throw FetchDataException(e.message + '\n' + e.response.toString());
    }
  }
}
