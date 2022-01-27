import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/modules/filmes/filmes_controller.dart';

class FilmesView extends GetView<FilmesController> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // itemCount: controller.filmes.length,
        itemCount: 3,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Filmes'),
            trailing: IconButton(
              icon: Icon(
                Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () {},
            ),
          );
        });
  }
}
