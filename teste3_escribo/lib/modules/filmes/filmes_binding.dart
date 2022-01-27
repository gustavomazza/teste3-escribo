import 'package:get/get.dart';
import 'package:teste3_escribo/modules/filmes/filmes_controller.dart';

class FilmesBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilmesController());
  }
}
