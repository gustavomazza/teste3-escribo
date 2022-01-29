import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/global/constants.dart';
import 'package:teste3_escribo/global/widgets/barra_superior.dart';
import 'package:teste3_escribo/modules/favoritos/favoritos_view.dart';
import 'package:teste3_escribo/modules/filmes/filmes_view.dart';
import 'package:teste3_escribo/modules/home/home_controller.dart';
import 'package:teste3_escribo/modules/personagens/personagens_view.dart';
import 'package:teste3_escribo/themes/app_color.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: [
              const BarraSuperior(),
              Container(
                color: AppColor.cinza,
                child: const TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  labelStyle:
                      TextStyle(fontSize: 11, fontWeight: FontWeight.bold ),
                      
                  // indicator: BoxDecoration(
                  //     color: AppColor.blue,
                  //     // borderRadius: BorderRadius.circular(25)
                  //     ),
                  tabs: [
                    Tab(
                      text: 'FILMES',
                    ),
                    Tab(
                      text: 'PERSONAGENS',
                    ),
                    Tab(
                      text: 'FAVORITOS',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.black,
                  child: TabBarView(
                    children: [
                      FilmesView(),
                      PersonagensView(),
                      FavoritosView(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
