import 'package:get/get.dart';
import 'package:teste3_escribo/data/model/personagem_model.dart';
import 'package:teste3_escribo/data/provider/personagem_provider.dart';

class PersonagemRepository {
  final PersonagemApiClient apiClient = Get.find<PersonagemApiClient>();

  Future<List<PersonagemModel>?> listarPersonagens() async {
    var resp = await apiClient.listarPersonagens();

    return resp['results']
        .map<PersonagemModel>((data) => PersonagemModel.fromJson(data))
        .toList();
  }
}
