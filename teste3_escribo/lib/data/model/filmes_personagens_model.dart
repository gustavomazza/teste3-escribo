class FilmePersonagemModel {
  // late final int id;
  late final String nome;
  late final String tipo;
  late final bool favorito;

  FilmePersonagemModel(this.nome, this.tipo, this.favorito);

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      // 'id': id,
      'nome': nome,
      'tipo': tipo,
      'favorito': favorito
    };
    return map;
  }

  FilmePersonagemModel.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    nome = json['nome'];
    tipo = json['tipo'];
    favorito = json['favorito'];
  }
}
