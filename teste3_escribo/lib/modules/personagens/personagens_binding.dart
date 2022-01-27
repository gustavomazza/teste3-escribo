import 'package:get/get.dart';
import 'package:teste3_escribo/data/provider/personagem_provider.dart';
import 'package:teste3_escribo/data/repository/personagem_repository.dart';
import 'package:teste3_escribo/modules/personagens/personagens_controller.dart';

class PersonagensBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PersonagensController());
    Get.lazyPut<PersonagemRepository>(() => PersonagemRepository());
    Get.lazyPut<PersonagemApiClient>(() => PersonagemApiClient());
  }
}
