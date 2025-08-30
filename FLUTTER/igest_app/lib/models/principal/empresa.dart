class Empresa {
  final int idEmpresa;
  final String grupoEmp;
  final String nomEmpresa;
  final String nomComercial;
  final String direccion;
  final String telefonos;
  final String ruc;
  final String sunatUsu;
  final String sunatPwd;
  final bool activo;
  final int idTipoEmpresa;
  final String dominio;
  final String dominioMail;
  final String codeName;
  final String interfaz; // JSON como String

  Empresa({
    required this.idEmpresa,
    required this.grupoEmp,
    required this.nomEmpresa,
    required this.nomComercial,
    required this.direccion,
    required this.telefonos,
    required this.ruc,
    required this.sunatUsu,
    required this.sunatPwd,
    required this.activo,
    required this.idTipoEmpresa,
    required this.dominio,
    required this.dominioMail,
    required this.codeName,
    required this.interfaz,
  });

  factory Empresa.fromJson(Map<String, dynamic> json) {
    return Empresa(
      idEmpresa: int.parse(json['idEmpresa']?.toString() ?? json['id_empresa'].toString()),
      grupoEmp: json['grupoEmp'] ?? json['grupo_emp'] ?? '',
      nomEmpresa: json['nomEmpresa'] ?? json['nom_empresa'] ?? '',
      nomComercial: json['nomComercial'] ?? json['nom_comercial'] ?? '',
      direccion: json['direccion'] ?? '',
      telefonos: json['telefonos'] ?? '',
      ruc: json['ruc'] ?? '',
      sunatUsu: json['sunatUsu'] ?? json['sunat_usu'] ?? '',
      sunatPwd: json['sunatPwd'] ?? json['sunat_pwd'] ?? '',
      activo: json['activo'] is bool ? json['activo'] : json['activo'].toString() == 'true',
      idTipoEmpresa: int.parse(json['idTipoEmpresa']?.toString() ?? json['id_tipo_empresa'].toString()),
      dominio: json['dominio'] ?? '',
      dominioMail: json['dominioMail'] ?? json['dominio_mail'] ?? '',
      codeName: json['codeName'] ?? json['code_name'] ?? '',
      interfaz: json['interfaz'] ?? '{}',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idEmpresa': idEmpresa,
      'grupoEmp': grupoEmp,
      'nomEmpresa': nomEmpresa,
      'nomComercial': nomComercial,
      'direccion': direccion,
      'telefonos': telefonos,
      'ruc': ruc,
      'sunatUsu': sunatUsu,
      'sunatPwd': sunatPwd,
      'activo': activo,
      'idTipoEmpresa': idTipoEmpresa,
      'dominio': dominio,
      'dominioMail': dominioMail,
      'codeName': codeName,
      'interfaz': interfaz,
    };
  }
}
