class Categoria {
  int idCategoria;
  String nomCategoria;
  String codInterno;
  int orden;
  int idNegocio;
  int idEmpresa;
  int idClaseSunat;

  Categoria({
    required this.idCategoria,
    required this.nomCategoria,
    required this.codInterno,
    required this.orden,
    required this.idNegocio,
    required this.idEmpresa,
    required this.idClaseSunat,
  });

  factory Categoria.fromJson(Map<String, dynamic> json) {
    return Categoria(
      idCategoria: json['id_categoria'],
      nomCategoria: json['nom_categoria'],
      codInterno: json['cod_interno'],
      orden: json['orden'],
      idNegocio: json['id_negocio'],
      idEmpresa: json['id_empresa'],
      idClaseSunat: json['id_clase_sunat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_categoria': idCategoria,
      'nom_categoria': nomCategoria,
      'cod_interno': codInterno,
      'orden': orden,
      'id_negocio': idNegocio,
      'id_empresa': idEmpresa,
      'id_clase_sunat': idClaseSunat,
    };
  }
}
