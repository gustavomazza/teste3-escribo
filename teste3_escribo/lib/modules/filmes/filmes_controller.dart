import 'package:get/get.dart';
import 'package:teste3_escribo/data/model/filme_model.dart';
import 'package:teste3_escribo/data/repository/filme_repository.dart';
import 'package:teste3_escribo/global/widgets/mensagem.dart';

class FilmesController extends GetxController with StateMixin {
  final _repository = Get.find<FilmeRepository>();
  final _filmes = <FilmeModel>[].obs;
  List<FilmeModel> get filmes => _filmes.toList();
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
      var listaFilmes = await _repository.listarFilmes();

      _filmes.addAll(listaFilmes!);
      print(_filmes[0].toJson());
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.success());
      mensagem('', e.toString());
    }
  }

  changeFavorite(index){
    isFavorite.value = !isFavorite.value;
    
  }
}
