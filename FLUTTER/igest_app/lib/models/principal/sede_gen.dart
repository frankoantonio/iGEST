class SedeGen {
  int idSede;
  int idPadre;
  int idEmpresa;
  int nivel;
  int idTipoSede;
  String nomSede;
  String dirSede;
  String idDistrito;
  bool activo;
  bool sunatOficial;
  String sunatCod;
  String facEleRuta;
  String facEleToken;
  String latitud;
  String longitud;
  int orden;

  SedeGen({
    required this.idSede,
    required this.idPadre,
    required this.idEmpresa,
    required this.nivel,
    required this.idTipoSede,
    required this.nomSede,
    required this.dirSede,
    required this.idDistrito,
    required this.activo,
    required this.sunatOficial,
    required this.sunatCod,
    required this.facEleRuta,
    required this.facEleToken,
    required this.latitud,
    required this.longitud,
    required this.orden,
  });

  factory SedeGen.fromJson(Map<String, dynamic> json) {
    return SedeGen(
      idSede: json['id_sede'],
      idPadre: json['id_padre'],
      idEmpresa: json['id_empresa'],
      nivel: json['nivel'],
      idTipoSede: json['id_tipo_sede'],
      nomSede: json['nom_sede'],
      dirSede: json['dir_sede'],
      idDistrito: json['id_distrito'],
      activo: json['activo'],
      sunatOficial: json['sunat_oficial'],
      sunatCod: json['sunat_cod'],
      facEleRuta: json['fac_ele_ruta'],
      facEleToken: json['fac_ele_token'],
      latitud: json['latitud'],
      longitud: json['longitud'],
      orden: json['orden'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_sede': idSede,
      'id_padre': idPadre,
      'id_empresa': idEmpresa,
      'nivel': nivel,
      'id_tipo_sede': idTipoSede,
      'nom_sede': nomSede,
      'dir_sede': dirSede,
      'id_distrito': idDistrito,
      'activo': activo,
      'sunat_oficial': sunatOficial,
      'sunat_cod': sunatCod,
      'fac_ele_ruta': facEleRuta,
      'fac_ele_token': facEleToken,
      'latitud': latitud,
      'longitud': longitud,
      'orden': orden,
    };
  }
}
