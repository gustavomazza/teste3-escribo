import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teste3_escribo/data/database_sqlite.dart';
import 'package:teste3_escribo/data/model/filmes_personagens_model.dart';

class FavoritosController extends GetxController with StateMixin {
  List<FilmePersonagemModel> listarFavoritosBanco = [];

  @override
  onInit() async {
    await listarFavoritosSQLite();
    

    super.onInit();
  }

  listarFavoritosSQLite() async {
    change([], status: RxStatus.loading());
    await DBProvider.db.getAllFavoritos().then((lista) => listarFavoritosBanco = lista);
    change([], status: RxStatus.success());
  }

  verificaCorBorda(tipo){
    if(tipo == 'filme'){
      return Colors.red;
    }else if(tipo == 'personagem'){
      return Colors.green;
    }
  }
}
