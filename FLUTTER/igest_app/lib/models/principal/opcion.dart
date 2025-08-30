class Opcion {
  int idOpcion;
  int idPadre;
  String idSistema;
  int idPerfil;
  String nomOpcion;
  String nomControl;
  int orden;
  int idTipoOpcion;
  int idTipoEmpresa;
  bool activo;
  bool premium;
  int idEmpresa;

  Opcion({
    required this.idOpcion,
    required this.idPadre,
    required this.idSistema,
    required this.idPerfil,
    required this.nomOpcion,
    required this.nomControl,
    required this.orden,
    required this.idTipoOpcion,
    required this.idTipoEmpresa,
    required this.activo,
    required this.premium,
    required this.idEmpresa,
  });

  factory Opcion.fromJson(Map<String, dynamic> json) {
    return Opcion(
      idOpcion: json['id_opcion'],
      idPadre: json['id_padre'],
      idSistema: json['id_sistema'],
      idPerfil: json['id_perfil'],
      nomOpcion: json['nom_opcion'],
      nomControl: json['nom_control'],
      orden: json['orden'],
      idTipoOpcion: json['id_tipo_opcion'],
      idTipoEmpresa: json['id_tipo_empresa'],
      activo: json['activo'],
      premium: json['premium'],
      idEmpresa: json['id_empresa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_opcion': idOpcion,
      'id_padre': idPadre,
      'id_sistema': idSistema,
      'id_perfil': idPerfil,
      'nom_opcion': nomOpcion,
      'nom_control': nomControl,
      'orden': orden,
      'id_tipo_opcion': idTipoOpcion,
      'id_tipo_empresa': idTipoEmpresa,
      'activo': activo,
      'premium': premium,
      'id_empresa': idEmpresa,
    };
  }
}
