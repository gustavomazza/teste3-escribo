import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/modules/personagens/personagens_controller.dart';

class PersonagensView extends GetView<PersonagensController> {
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return ListView.builder(
          itemCount: controller.personagens.length,
          itemBuilder: (context, index) {
            final personagem = controller.personagens[index];
            return ListTile(
              title: Text(personagem.name),
              trailing: IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
            );
          },
        );
      },
    );
  }
}
