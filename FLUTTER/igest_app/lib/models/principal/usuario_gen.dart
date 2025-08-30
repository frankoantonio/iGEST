class UsuarioGen {
  int idUsuario;
  String nomUsu;
  String pwdUsu;
  DateTime feOperacion;
  bool activo;
  bool cambioPwd;

  UsuarioGen({
    required this.idUsuario,
    required this.nomUsu,
    required this.pwdUsu,
    required this.feOperacion,
    required this.activo,
    required this.cambioPwd,
  });

  factory UsuarioGen.fromJson(Map<String, dynamic> json) {
    return UsuarioGen(
      idUsuario: json['id_usuario'],
      nomUsu: json['nom_usu'],
      pwdUsu: json['pwd_usu'],
      feOperacion: DateTime.parse(json['fe_operacion']),
      activo: json['activo'],
      cambioPwd: json['cambio_pwd'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_usuario': idUsuario,
      'nom_usu': nomUsu,
      'pwd_usu': pwdUsu,
      'fe_operacion': feOperacion.toIso8601String(),
      'activo': activo,
      'cambio_pwd': cambioPwd,
    };
  }
}
