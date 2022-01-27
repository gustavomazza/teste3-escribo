import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/routes/app_pages.dart';
import 'package:teste3_escribo/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Escribo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
