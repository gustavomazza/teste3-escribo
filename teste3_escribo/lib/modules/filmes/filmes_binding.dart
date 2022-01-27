import 'package:get/get.dart';
import 'package:teste3_escribo/data/provider/filme_provider.dart';
import 'package:teste3_escribo/data/repository/filme_repository.dart';
import 'package:teste3_escribo/modules/filmes/filmes_controller.dart';

class FilmesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilmesController());
    Get.lazyPut<FilmeRepository>(() => FilmeRepository());
    Get.lazyPut<FilmeApiClient>(() => FilmeApiClient());
  }
}
