import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/global/constants.dart';
import 'package:teste3_escribo/global/widgets/barra_superior.dart';
import 'package:teste3_escribo/modules/filmes/filmes_view.dart';
import 'package:teste3_escribo/modules/home/home_controller.dart';
import 'package:teste3_escribo/modules/personagens/personagens_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            const BarraSuperior(),
            Padding(
              padding: const EdgeInsets.all(defaultPadding / 2),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                labelStyle: TextStyle(fontSize: 10),
                indicator: BoxDecoration(
                    color: Get.theme.primaryColor,
                    borderRadius: BorderRadius.circular(25)),
                tabs: const [
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
                    favoritos(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

favoritos() {
  return Container();
}
