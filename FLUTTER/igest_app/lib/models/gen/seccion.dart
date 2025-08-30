class Seccion {
  int idSeccion;
  int idNegocio;
  int idCampania;
  int idNivEdu;
  int idGrado;
  int idTipTurno;
  String nomSeccion;
  int idAmbiente;
  int numVacante;
  bool activo;
  String nomCorto;
  String nomGrupo1;
  String nomGrupo2;
  String nomGrado;
  String nomNivEdu;

  Seccion({
    required this.idSeccion,
    required this.idNegocio,
    required this.idCampania,
    required this.idNivEdu,
    required this.idGrado,
    required this.idTipTurno,
    required this.nomSeccion,
    required this.idAmbiente,
    required this.numVacante,
    required this.activo,
    required this.nomCorto,
    required this.nomGrupo1,
    required this.nomGrupo2,
    required this.nomGrado,
    required this.nomNivEdu,
  });

  factory Seccion.fromJson(Map<String, dynamic> json) {
    return Seccion(
      idSeccion: json['id_seccion'],
      idNegocio: json['id_negocio'],
      idCampania: json['id_campania'],
      idNivEdu: json['id_niv_edu'],
      idGrado: json['id_grado'],
      idTipTurno: json['id_tip_turno'],
      nomSeccion: json['nom_seccion'],
      idAmbiente: json['id_ambiente'],
      numVacante: json['num_vacante'],
      activo: json['activo'],
      nomCorto: json['nom_corto'],
      nomGrupo1: json['nom_grupo1'],
      nomGrupo2: json['nom_grupo2'],
      nomGrado: json['nom_grado'],
      nomNivEdu: json['nom_niv_edu'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_seccion': idSeccion,
      'id_negocio': idNegocio,
      'id_campania': idCampania,
      'id_niv_edu': idNivEdu,
      'id_grado': idGrado,
      'id_tip_turno': idTipTurno,
      'nom_seccion': nomSeccion,
      'id_ambiente': idAmbiente,
      'num_vacante': numVacante,
      'activo': activo,
      'nom_corto': nomCorto,
      'nom_grupo1': nomGrupo1,
      'nom_grupo2': nomGrupo2,
      'nom_grado': nomGrado,
      'nom_niv_edu': nomNivEdu,
    };
  }
}
