class GrpPrecio {
  int idGrpprecio;
  int idNegocio;
  DateTime feIni;
  DateTime feFin;
  String nomGrpprecio;
  bool activo;

  GrpPrecio({
    required this.idGrpprecio,
    required this.idNegocio,
    required this.feIni,
    required this.feFin,
    required this.nomGrpprecio,
    required this.activo,
  });

  factory GrpPrecio.fromJson(Map<String, dynamic> json) {
    return GrpPrecio(
      idGrpprecio: json['id_grpprecio'],
      idNegocio: json['id_negocio'],
      feIni: DateTime.parse(json['fe_ini']),
      feFin: DateTime.parse(json['fe_fin']),
      nomGrpprecio: json['nom_grpprecio'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_grpprecio': idGrpprecio,
      'id_negocio': idNegocio,
      'fe_ini': feIni.toIso8601String(),
      'fe_fin': feFin.toIso8601String(),
      'nom_grpprecio': nomGrpprecio,
      'activo': activo,
    };
  }
}
