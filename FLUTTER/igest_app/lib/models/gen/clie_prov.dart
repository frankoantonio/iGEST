class ClieProv {
  int idCliPro;
  int idTipoEstadoContrib;
  int idTipoCondicionContrib;
  int idDireccion;
  String correo;
  String celular;
  String telefono;
  String contacto;
  String obs;

  ClieProv({
    required this.idCliPro,
    required this.idTipoEstadoContrib,
    required this.idTipoCondicionContrib,
    required this.idDireccion,
    required this.correo,
    required this.celular,
    required this.telefono,
    required this.contacto,
    required this.obs,
  });

  factory ClieProv.fromJson(Map<String, dynamic> json) {
    return ClieProv(
      idCliPro: json['id_cli_pro'],
      idTipoEstadoContrib: json['id_tipo_estado_contrib'],
      idTipoCondicionContrib: json['id_tipo_condicion_contrib'],
      idDireccion: json['id_direccion'],
      correo: json['correo'],
      celular: json['celular'],
      telefono: json['telefono'],
      contacto: json['contacto'],
      obs: json['obs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_cli_pro': idCliPro,
      'id_tipo_estado_contrib': idTipoEstadoContrib,
      'id_tipo_condicion_contrib': idTipoCondicionContrib,
      'id_direccion': idDireccion,
      'correo': correo,
      'celular': celular,
      'telefono': telefono,
      'contacto': contacto,
      'obs': obs,
    };
  }
}
