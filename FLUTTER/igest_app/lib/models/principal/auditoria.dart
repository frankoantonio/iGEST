class Auditoria {
  int idAuditoria;
  int anio;
  String nomModulo;
  String nomEntidad;
  int idEntidad;
  String operacion;
  int idUsuario;
  String nomUsuario;
  String ip;
  String host;
  DateTime feOper;
  DateTime fhOper;
  String valores;

  Auditoria({
    required this.idAuditoria,
    required this.anio,
    required this.nomModulo,
    required this.nomEntidad,
    required this.idEntidad,
    required this.operacion,
    required this.idUsuario,
    required this.nomUsuario,
    required this.ip,
    required this.host,
    required this.feOper,
    required this.fhOper,
    required this.valores,
  });

  factory Auditoria.fromJson(Map<String, dynamic> json) {
    return Auditoria(
      idAuditoria: json['id_auditoria'],
      anio: json['anio'],
      nomModulo: json['nom_modulo'],
      nomEntidad: json['nom_entidad'],
      idEntidad: json['id_entidad'],
      operacion: json['operacion'],
      idUsuario: json['id_usuario'],
      nomUsuario: json['nom_usuario'],
      ip: json['ip'],
      host: json['host'],
      feOper: DateTime.parse(json['fe_oper']),
      fhOper: DateTime.parse(json['fh_oper']),
      valores: json['valores'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_auditoria': idAuditoria,
      'anio': anio,
      'nom_modulo': nomModulo,
      'nom_entidad': nomEntidad,
      'id_entidad': idEntidad,
      'operacion': operacion,
      'id_usuario': idUsuario,
      'nom_usuario': nomUsuario,
      'ip': ip,
      'host': host,
      'fe_oper': feOper.toIso8601String(),
      'fh_oper': fhOper.toIso8601String(),
      'valores': valores,
    };
  }
}
