import 'package:get/get.dart';
import 'package:teste3_escribo/data/model/personagem_model.dart';
import 'package:teste3_escribo/data/repository/personagem_repository.dart';
import 'package:teste3_escribo/global/widgets/mensagem.dart';

class PersonagensController extends GetxController with StateMixin {
  final _repository = Get.find<PersonagemRepository>();
  final _personagens = <PersonagemModel>[].obs;
  List<PersonagemModel> get personagens => _personagens.toList();

  @override
  onInit() async {
    await listarPersonagens();

    super.onInit();
  }

  listarPersonagens() async {
    change([], status: RxStatus.loading());
    _personagens.clear();
    try {
      var listaPersonagens = await _repository.listarPersonagens();

      _personagens.addAll(listaPersonagens!);
      print(_personagens[0].toJson());
      change([], status: RxStatus.success());
    } catch (e) {
      change([], status: RxStatus.success());
      mensagem('', e.toString());
    }
  }
}
