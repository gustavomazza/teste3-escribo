import 'package:get/get.dart';
import 'package:teste3_escribo/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
