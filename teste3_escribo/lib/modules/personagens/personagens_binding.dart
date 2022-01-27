import 'package:get/get.dart';
import 'package:teste3_escribo/modules/personagens/personagens_controller.dart';

class PersonagensBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PersonagensController());
  }
}
