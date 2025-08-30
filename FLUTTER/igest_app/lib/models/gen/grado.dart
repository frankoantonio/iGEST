class Grado {
  int idGrado;
  int idNegocio;
  int numGrado;
  String nomGrado;
  int idGradoSgte;
  int idNivEdu;
  bool activo;
  int idAreaProf;

  Grado({
    required this.idGrado,
    required this.idNegocio,
    required this.numGrado,
    required this.nomGrado,
    required this.idGradoSgte,
    required this.idNivEdu,
    required this.activo,
    required this.idAreaProf,
  });

  factory Grado.fromJson(Map<String, dynamic> json) {
    return Grado(
      idGrado: json['id_grado'],
      idNegocio: json['id_negocio'],
      numGrado: json['num_grado'],
      nomGrado: json['nom_grado'],
      idGradoSgte: json['id_grado_sgte'],
      idNivEdu: json['id_niv_edu'],
      activo: json['activo'],
      idAreaProf: json['id_area_prof'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_grado': idGrado,
      'id_negocio': idNegocio,
      'num_grado': numGrado,
      'nom_grado': nomGrado,
      'id_grado_sgte': idGradoSgte,
      'id_niv_edu': idNivEdu,
      'activo': activo,
      'id_area_prof': idAreaProf,
    };
  }
}
