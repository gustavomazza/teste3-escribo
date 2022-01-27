import 'package:get/get.dart';
import 'package:teste3_escribo/data/model/filme_model.dart';
import 'package:teste3_escribo/data/provider/filme_provider.dart';

class FilmeRepository {
  final FilmeApiClient apiClient = Get.find<FilmeApiClient>();

  Future<List<FilmeModel>?> listarFilmes() async {
    var resp = await apiClient.listarFilmes();

    return resp['results']
        .map<FilmeModel>((data) => FilmeModel.fromJson(data))
        .toList();
  }
}
