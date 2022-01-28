import 'package:get/get.dart';
import 'package:teste3_escribo/data/database_sqlite.dart';
import 'package:teste3_escribo/data/model/filmes_personagens_model.dart';
import 'package:teste3_escribo/data/model/filme_model.dart';
import 'package:teste3_escribo/data/repository/filme_repository.dart';
import 'package:teste3_escribo/global/widgets/mensagem.dart';

class FilmesController extends GetxController with StateMixin {
  final _repository = Get.find<FilmeRepository>();
  final _filmes = <FilmeModel>[].obs;
  List<FilmeModel> get filmes => _filmes.toList();

  final _listaFilmesSQlite = <FilmePersonagemModel>[].obs;
  List<FilmePersonagemModel> get listaFilmesSQlite =>
      _listaFilmesSQlite.toList();
  RxBool isFavorite = false.obs;

  @override
  onInit() async {
    await listarFilmes();

    super.onInit();
  }

  listarFilmes() async {
    change([], status: RxStatus.loading());
    _filmes.clear();
    try {
      var listaFilmesApi = await _repository.listarFilmes();

      _filmes.addAll(listaFilmesApi!);
      print(_filmes[0].toJson());

      for (var i = 0; i < _filmes.length; i++) {
        bool existeFavorito = await DBProvider.db.getFavorito(_filmes[i].title);
        if (!existeFavorito) {
          FilmePersonagemModel favorito =
              FilmePersonagemModel(_filmes[i].title, 'filme', false);
          await DBProvider.db.createFavorito(favorito);
        }
      }

      var filmes = await DBProvider.db.getAllFilmes();
      _listaFilmesSQlite.addAll(filmes);

      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.success());
      mensagem('', e.toString());
    }
  }

  changeFavorite(index) {
    isFavorite.value = !isFavorite.value;
  }
}
