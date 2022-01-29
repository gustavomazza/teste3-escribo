import 'package:get/get.dart';
import 'package:teste3_escribo/data/database_sqlite.dart';
import 'package:teste3_escribo/data/model/filmes_personagens_model.dart';
import 'package:teste3_escribo/data/model/personagem_model.dart';
import 'package:teste3_escribo/data/repository/personagem_repository.dart';
import 'package:teste3_escribo/global/widgets/mensagem.dart';
import 'package:teste3_escribo/modules/favoritos/favoritos_controller.dart';

class PersonagensController extends GetxController with StateMixin {
  final _repository = Get.find<PersonagemRepository>();
  final _personagens = <PersonagemModel>[].obs;
  List<PersonagemModel> get personagens => _personagens.toList();

  List<FilmePersonagemModel> listarPersonagensBanco = [];
  RxBool isFavorite = false.obs;

  @override
  onInit() async {
    await listarPersonagensApi();

    super.onInit();
  }

  listarPersonagensApi() async {
    change([], status: RxStatus.loading());
    _personagens.clear();
    try {
      var listaPersonagensApi = await _repository.listarPersonagens();

      _personagens.addAll(listaPersonagensApi!);
      print(_personagens[0].toJson());

      await listarPersonagensSQLite();
    } catch (e) {
      change([], status: RxStatus.success());
      mensagem('', e.toString());
    }
  }

  listarPersonagensSQLite() async {
    for (var i = 0; i < _personagens.length; i++) {
      bool existeFavorito =
          await DBProvider.db.getFavorito(_personagens[i].name);
      if (!existeFavorito) {
        FilmePersonagemModel favorito =
            FilmePersonagemModel(_personagens[i].name, 'personagem', 0);
        await DBProvider.db.createFavorito(favorito);
        print(favorito);
      }
    }

    await DBProvider.db
        .getAllPersonagens()
        .then((lista) => listarPersonagensBanco = lista);

    change([], status: RxStatus.success());
  }

  changeFavorito(nome) async {
    String favorito = await DBProvider.db.getFavoritoInt(nome);
    int favoritoInt;
    if (favorito == '1') {
      favoritoInt = 0;
    } else {
      favoritoInt = 1;
    }
    await DBProvider.db.updateFavorito(favoritoInt, nome);

    await listarPersonagensSQLite();

    final _favoritosController = Get.find<FavoritosController>();

    await _favoritosController.listarFavoritosSQLite();
  }
}
