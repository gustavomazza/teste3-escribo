import 'package:get/get.dart';
import 'package:teste3_escribo/modules/favoritos/favoritos_controller.dart';

class FavoritosBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FavoritosController());
   
  }
}
