class FilmePersonagemModel {

  late final String nome;
  late final String tipo;
  late final int favorito;

  FilmePersonagemModel(this.nome, this.tipo, this.favorito);

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'nome': nome,
      'tipo': tipo,
      'favorito': favorito
    };
    return map;
  }

  FilmePersonagemModel.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    tipo = json['tipo'];
    favorito = json['favorito'];
  }
}
