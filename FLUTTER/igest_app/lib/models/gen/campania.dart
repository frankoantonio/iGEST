class Campania {
  int idCampania;
  int idNegocio;
  int idSede;
  int anio;
  int frecuencia;
  int idProdProy;
  DateTime feIni;
  DateTime feFin;
  String nomCampania;
  bool activo;
  int idTipoModEst;
  String codSede;
  int idTipoTurno;
  int idTipoInscripcion;
  bool matrSinPago;
  DateTime feIniClas;
  DateTime feFinClas;
  int idTipoPeriodo;
  bool redefinir;

  Campania({
    required this.idCampania,
    required this.idNegocio,
    required this.idSede,
    required this.anio,
    required this.frecuencia,
    required this.idProdProy,
    required this.feIni,
    required this.feFin,
    required this.nomCampania,
    required this.activo,
    required this.idTipoModEst,
    required this.codSede,
    required this.idTipoTurno,
    required this.idTipoInscripcion,
    required this.matrSinPago,
    required this.feIniClas,
    required this.feFinClas,
    required this.idTipoPeriodo,
    required this.redefinir,
  });

  factory Campania.fromJson(Map<String, dynamic> json) {
    return Campania(
      idCampania: json['id_campania'],
      idNegocio: json['id_negocio'],
      idSede: json['id_sede'],
      anio: json['anio'],
      frecuencia: json['frecuencia'],
      idProdProy: json['id_prod_proy'],
      feIni: DateTime.parse(json['fe_ini']),
      feFin: DateTime.parse(json['fe_fin']),
      nomCampania: json['nom_campania'],
      activo: json['activo'],
      idTipoModEst: json['id_tipo_mod_est'],
      codSede: json['cod_sede'],
      idTipoTurno: json['id_tipo_turno'],
      idTipoInscripcion: json['id_tipo_inscripcion'],
      matrSinPago: json['matr_sin_pago'],
      feIniClas: DateTime.parse(json['fe_ini_clas']),
      feFinClas: DateTime.parse(json['fe_fin_clas']),
      idTipoPeriodo: json['id_tipo_periodo'],
      redefinir: json['redefinir'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_campania': idCampania,
      'id_negocio': idNegocio,
      'id_sede': idSede,
      'anio': anio,
      'frecuencia': frecuencia,
      'id_prod_proy': idProdProy,
      'fe_ini': feIni.toIso8601String(),
      'fe_fin': feFin.toIso8601String(),
      'nom_campania': nomCampania,
      'activo': activo,
      'id_tipo_mod_est': idTipoModEst,
      'cod_sede': codSede,
      'id_tipo_turno': idTipoTurno,
      'id_tipo_inscripcion': idTipoInscripcion,
      'matr_sin_pago': matrSinPago,
      'fe_ini_clas': feIniClas.toIso8601String(),
      'fe_fin_clas': feFinClas.toIso8601String(),
      'id_tipo_periodo': idTipoPeriodo,
      'redefinir': redefinir,
    };
  }
}
