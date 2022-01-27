import 'package:get/get.dart';
import 'package:teste3_escribo/modules/home/home_binding.dart';
import 'package:teste3_escribo/modules/home/home_view.dart';
import 'package:teste3_escribo/routes/app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
  ];
}
