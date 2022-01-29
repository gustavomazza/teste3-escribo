import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste3_escribo/data/model/filmes_personagens_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database!;

    // If database don't exists, create one
    _database = await initDB();

    return _database!;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'favoritos.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Favoritos('
          'id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'nome TEXT,'
          'tipo TEXT,'
          'favorito Boolean'
          ')');
    });
  }

  // Insert employee on database
  Future<int> createFavorito(FilmePersonagemModel newFilmePersonagem) async {
    // await deleteAllFavoritos();
    final db = await database;
    var res = await db.insert('Favoritos', newFilmePersonagem.toJson());

    return res;
  }

  // Delete all employees
  // Future<int> deleteAllFavoritos() async {
  //   final db = await database;
  //   final res = await db.rawDelete('DELETE FROM Favoritos');

  //   return res;
  // }
  Future updateFavorito(favorito, nome) async {
    final db = await database;
    final res = await db.rawUpdate("UPDATE Favoritos set favorito = '$favorito' where nome = '$nome'");

    return;
  }

  Future<bool> getFavorito(nome) async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Favoritos where nome = '$nome'");

    if (res.length == 0) {
      return false;
    } else {
      return true;
    }
  }

  Future<String> getFavoritoInt(nome) async {
    final db = await database;
    final res = await db.rawQuery("SELECT favorito FROM Favoritos where nome = '$nome'");

    print('res' + res[0]['favorito'].toString());
    return res[0]['favorito'].toString();
  }

  Future<List<FilmePersonagemModel>> getAllFilmes() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Favoritos where tipo = 'filme'");

    print('data: ' + res.toString());

    List<FilmePersonagemModel> list = res
            .map<FilmePersonagemModel>(
                (data) => FilmePersonagemModel.fromJson(data))
            .toList();
      
    print('list: ' + list.toString());

    return list;
  }

  Future<List<FilmePersonagemModel>> getAllPersonagens() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Favoritos where tipo = 'personagem'");

    print('data: ' + res.toString());

    List<FilmePersonagemModel> list = res
            .map<FilmePersonagemModel>(
                (data) => FilmePersonagemModel.fromJson(data))
            .toList();
      
    print('list: ' + list.toString());

    return list;
  }

  Future<List<FilmePersonagemModel>> getAllFavoritos() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Favoritos where favorito = 1");

    print('data: ' + res.toString());

    List<FilmePersonagemModel> list = res
            .map<FilmePersonagemModel>(
                (data) => FilmePersonagemModel.fromJson(data))
            .toList();
      
    print('list: ' + list.toString());

    return list;
  }



  Future close() async{
    final db = await database;
    db.close();
  }
}
