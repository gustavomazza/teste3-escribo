import 'package:get/get.dart';
import 'package:teste3_escribo/data/database_sqlite.dart';
import 'package:teste3_escribo/data/model/filmes_personagens_model.dart';
import 'package:teste3_escribo/data/model/filme_model.dart';
import 'package:teste3_escribo/data/repository/filme_repository.dart';
import 'package:teste3_escribo/global/widgets/mensagem.dart';
import 'package:teste3_escribo/modules/favoritos/favoritos_controller.dart';

class FilmesController extends GetxController with StateMixin {
  final _repository = Get.find<FilmeRepository>();
  final _filmes = <FilmeModel>[].obs;
  List<FilmeModel> get filmes => _filmes.toList();

  List<FilmePersonagemModel> listarFilmesBanco = [];

  FavoritosController favoritosController = FavoritosController();

  @override
  onInit() async {
    await listarFilmesApi();

    super.onInit();
  }

  listarFilmesApi() async {
    change([], status: RxStatus.loading());
    _filmes.clear();
    try {
      var listaFilmesApi = await _repository.listarFilmes();

      _filmes.addAll(listaFilmesApi!);

      await listarFilmesSQLite();
    } catch (e) {
      change([], status: RxStatus.success());
      mensagem('', e.toString());
    }
  }

  listarFilmesSQLite() async {
    for (var i = 0; i < _filmes.length; i++) {
      bool existeFavorito = await DBProvider.db.getFavorito(_filmes[i].title);
      if (!existeFavorito) {
        FilmePersonagemModel favorito =
            FilmePersonagemModel(_filmes[i].title, 'filme', 0);
        await DBProvider.db.createFavorito(favorito);
    
      }
    }

    await DBProvider.db
        .getAllFilmes()
        .then((lista) => listarFilmesBanco = lista);

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

    await listarFilmesSQLite();

    final _favoritosController = Get.find<FavoritosController>();

    await _favoritosController.listarFavoritosSQLite();
  }
}
