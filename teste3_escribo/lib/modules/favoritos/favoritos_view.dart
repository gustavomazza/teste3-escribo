import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/modules/favoritos/favoritos_controller.dart';
import 'package:teste3_escribo/modules/filmes/filmes_controller.dart';

class FavoritosView extends GetView<FavoritosController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return ListView.builder(
        itemCount: controller.listarFavoritosBanco.length,
        itemBuilder: (context, index) {
          final favorito = controller.listarFavoritosBanco[index];
          return Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: controller.verificaCorBorda(favorito.tipo), width: 5),
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(25),
              child: Center(
                child: Text(favorito.nome),
              ),
            ),
          );
        },
      );
    });
  }
}
