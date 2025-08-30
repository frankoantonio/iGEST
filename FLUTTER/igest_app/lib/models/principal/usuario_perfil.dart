class UsuarioPerfil {
  int idUsuPerfil;
  int idUsuario;
  int idPerfil;
  bool activo;
  bool nuevo;
  bool modificar;
  bool eliminar;
  bool imprimir;

  UsuarioPerfil({
    required this.idUsuPerfil,
    required this.idUsuario,
    required this.idPerfil,
    required this.activo,
    required this.nuevo,
    required this.modificar,
    required this.eliminar,
    required this.imprimir,
  });

  factory UsuarioPerfil.fromJson(Map<String, dynamic> json) {
    return UsuarioPerfil(
      idUsuPerfil: json['id_usu_perfil'],
      idUsuario: json['id_usuario'],
      idPerfil: json['id_perfil'],
      activo: json['activo'],
      nuevo: json['nuevo'],
      modificar: json['modificar'],
      eliminar: json['eliminar'],
      imprimir: json['imprimir'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_usu_perfil': idUsuPerfil,
      'id_usuario': idUsuario,
      'id_perfil': idPerfil,
      'activo': activo,
      'nuevo': nuevo,
      'modificar': modificar,
      'eliminar': eliminar,
      'imprimir': imprimir,
    };
  }
}
