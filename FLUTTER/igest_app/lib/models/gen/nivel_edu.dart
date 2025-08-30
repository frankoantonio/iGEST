class NivelEdu {
  int idNivEdu;
  int idNegocio;
  int idTipoNivEduc;
  String nomNivEdu;
  bool postula;
  int orden;
  bool activo;

  NivelEdu({
    required this.idNivEdu,
    required this.idNegocio,
    required this.idTipoNivEduc,
    required this.nomNivEdu,
    required this.postula,
    required this.orden,
    required this.activo,
  });

  factory NivelEdu.fromJson(Map<String, dynamic> json) {
    return NivelEdu(
      idNivEdu: json['id_niv_edu'],
      idNegocio: json['id_negocio'],
      idTipoNivEduc: json['id_tipo_niv_educ'],
      nomNivEdu: json['nom_niv_edu'],
      postula: json['postula'],
      orden: json['orden'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_niv_edu': idNivEdu,
      'id_negocio': idNegocio,
      'id_tipo_niv_educ': idTipoNivEduc,
      'nom_niv_edu': nomNivEdu,
      'postula': postula,
      'orden': orden,
      'activo': activo,
    };
  }
}
