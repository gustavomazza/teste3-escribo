import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/modules/favoritos/favoritos_controller.dart';

class FavoritosView extends GetView<FavoritosController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return controller.listarFavoritosBanco.isNotEmpty ? ListView.builder(
        itemCount: controller.listarFavoritosBanco.length,
        itemBuilder: (context, index) {
          final favorito = controller.listarFavoritosBanco[index];
          return Container(
            margin: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              border: Border.all(color: controller.verificaCorBorda(favorito.tipo), width: 1),
              
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Text(favorito.nome, style: const TextStyle(color: Colors.white,),),
              ),
            ),
          );
        },
      ) : const Center(child: Text('Você não possui nenhum favorito.', style: TextStyle(fontSize: 16, color: Colors.white),),);
    });
  }
}
