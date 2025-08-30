class UsuarioSistema {
  int idUsuSis;
  int idEmpresa;
  int idUsuario;
  String idSistema;
  bool activo;

  UsuarioSistema({
    required this.idUsuSis,
    required this.idEmpresa,
    required this.idUsuario,
    required this.idSistema,
    required this.activo,
  });

  factory UsuarioSistema.fromJson(Map<String, dynamic> json) {
    return UsuarioSistema(
      idUsuSis: json['id_usu_sis'],
      idEmpresa: json['id_empresa'],
      idUsuario: json['id_usuario'],
      idSistema: json['id_sistema'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_usu_sis': idUsuSis,
      'id_empresa': idEmpresa,
      'id_usuario': idUsuario,
      'id_sistema': idSistema,
      'activo': activo,
    };
  }
}
