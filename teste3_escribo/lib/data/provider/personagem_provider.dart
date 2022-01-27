import 'package:dio/dio.dart';
import 'package:teste3_escribo/data/dio_client.dart';

class PersonagemApiClient {
  final DioClient _dioClient = DioClient();

  Future<Map<String, dynamic>> listarPersonagens() async {
    final Dio _dio = await _dioClient.getDioClient();

    try {
      final response = await _dio.get('/people');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw FetchDataException('Falha ao consultar personagens.');
      }
    } on DioError catch (e) {
      throw FetchDataException(e.message + '\n' + e.response.toString());
    }
  }
}
