import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/modules/personagens/personagens_controller.dart';

class PersonagensView extends GetView<PersonagensController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: controller.filmes.length,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Personagens'),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          );
        });
  }
}
