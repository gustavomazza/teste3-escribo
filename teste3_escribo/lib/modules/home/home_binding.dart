import 'package:get/get.dart';
import 'package:teste3_escribo/data/provider/filme_provider.dart';
import 'package:teste3_escribo/data/provider/personagem_provider.dart';
import 'package:teste3_escribo/data/repository/filme_repository.dart';
import 'package:teste3_escribo/data/repository/personagem_repository.dart';
import 'package:teste3_escribo/modules/favoritos/favoritos_controller.dart';
import 'package:teste3_escribo/modules/filmes/filmes_controller.dart';
import 'package:teste3_escribo/modules/home/home_controller.dart';
import 'package:teste3_escribo/modules/personagens/personagens_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());

    Get.lazyPut<FilmesController>(() => FilmesController());
    Get.lazyPut<FilmeRepository>(() => FilmeRepository());
    Get.lazyPut<FilmeApiClient>(() => FilmeApiClient());

    Get.lazyPut<PersonagensController>(() => PersonagensController());
    Get.lazyPut<PersonagemRepository>(() => PersonagemRepository());
    Get.lazyPut<PersonagemApiClient>(() => PersonagemApiClient());

    Get.lazyPut<FavoritosController>(() => FavoritosController());
  }
}
