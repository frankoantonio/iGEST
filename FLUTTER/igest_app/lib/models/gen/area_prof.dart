class AreaProf {
  int idAreaProf;
  int idNegocio;
  String nomAreaProf;
  int idTipoGrupoEst;
  bool activo;
  int orden;

  AreaProf({
    required this.idAreaProf,
    required this.idNegocio,
    required this.nomAreaProf,
    required this.idTipoGrupoEst,
    required this.activo,
    required this.orden,
  });

  factory AreaProf.fromJson(Map<String, dynamic> json) {
    return AreaProf(
      idAreaProf: json['id_area_prof'],
      idNegocio: json['id_negocio'],
      nomAreaProf: json['nom_area_prof'],
      idTipoGrupoEst: json['id_tipo_grupo_est'],
      activo: json['activo'],
      orden: json['orden'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_area_prof': idAreaProf,
      'id_negocio': idNegocio,
      'nom_area_prof': nomAreaProf,
      'id_tipo_grupo_est': idTipoGrupoEst,
      'activo': activo,
      'orden': orden,
    };
  }
}
