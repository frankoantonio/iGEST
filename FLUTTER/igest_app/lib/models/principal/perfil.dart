class Perfil {
  int idPerfil;
  String idSistema;
  String nomPerfil;
  bool activo;
  int idTipoEmpresa;
  String descripcion;
  int idEmpresa;

  Perfil({
    required this.idPerfil,
    required this.idSistema,
    required this.nomPerfil,
    required this.activo,
    required this.idTipoEmpresa,
    required this.descripcion,
    required this.idEmpresa,
  });

  factory Perfil.fromJson(Map<String, dynamic> json) {
    return Perfil(
      idPerfil: json['id_perfil'],
      idSistema: json['id_sistema'],
      nomPerfil: json['nom_perfil'],
      activo: json['activo'],
      idTipoEmpresa: json['id_tipo_empresa'],
      descripcion: json['descripcion'],
      idEmpresa: json['id_empresa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_perfil': idPerfil,
      'id_sistema': idSistema,
      'nom_perfil': nomPerfil,
      'activo': activo,
      'id_tipo_empresa': idTipoEmpresa,
      'descripcion': descripcion,
      'id_empresa': idEmpresa,
    };
  }
}
