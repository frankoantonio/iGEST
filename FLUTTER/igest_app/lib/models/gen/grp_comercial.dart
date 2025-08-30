class GrpComercial {
  int idGrpcom;
  int idNegociolocal;
  String idTigrpcom;
  String nomGrpcom;
  bool activo;
  int idSupervisor;
  String pvIdalmacenes;
  int pvIdprecios;
  String seIdcomp;
  int seNucomp;

  GrpComercial({
    required this.idGrpcom,
    required this.idNegociolocal,
    required this.idTigrpcom,
    required this.nomGrpcom,
    required this.activo,
    required this.idSupervisor,
    required this.pvIdalmacenes,
    required this.pvIdprecios,
    required this.seIdcomp,
    required this.seNucomp,
  });

  factory GrpComercial.fromJson(Map<String, dynamic> json) {
    return GrpComercial(
      idGrpcom: json['id_grpcom'],
      idNegociolocal: json['id_negociolocal'],
      idTigrpcom: json['id_tigrpcom'],
      nomGrpcom: json['nom_grpcom'],
      activo: json['activo'],
      idSupervisor: json['id_supervisor'],
      pvIdalmacenes: json['pv_idalmacenes'],
      pvIdprecios: json['pv_idprecios'],
      seIdcomp: json['se_idcomp'],
      seNucomp: json['se_nucomp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_grpcom': idGrpcom,
      'id_negociolocal': idNegociolocal,
      'id_tigrpcom': idTigrpcom,
      'nom_grpcom': nomGrpcom,
      'activo': activo,
      'id_supervisor': idSupervisor,
      'pv_idalmacenes': pvIdalmacenes,
      'pv_idprecios': pvIdprecios,
      'se_idcomp': seIdcomp,
      'se_nucomp': seNucomp,
    };
  }
}
