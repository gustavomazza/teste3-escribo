import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/modules/personagens/personagens_controller.dart';

class PersonagensView extends GetView<PersonagensController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
        return ListView.builder(
          itemCount: controller.personagens.length,
          itemBuilder: (context, index) {
            final personagem = controller.listarPersonagensBanco[index];
            return ListTile(
              title: Text(personagem.nome),
              trailing: IconButton(
                 icon: personagem.favorito == 1
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                      ),
                onPressed: () {
                  controller.changeFavorito(personagem.nome);
                },
              ),
              onTap: (){controller.changeFavorito(personagem.nome);},
            );
          },
        );
      },
    );
  }
}
