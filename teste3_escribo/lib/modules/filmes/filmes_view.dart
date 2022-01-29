import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/modules/filmes/filmes_controller.dart';

class FilmesView extends GetView<FilmesController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return ListView.builder(
        itemCount: controller.filmes.length,
        itemBuilder: (context, index) {
          final filme = controller.listarFilmesBanco[index];
          return ListTile(
              title: Text(filme.nome),
              trailing: IconButton(
                icon: filme.favorito == 1
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                onPressed: () {
                  controller.changeFavorito(filme.nome);
                },
              ),
              onTap: (){controller.changeFavorito(filme.nome);},
            
          );
        },
      );
    });
  }
}
