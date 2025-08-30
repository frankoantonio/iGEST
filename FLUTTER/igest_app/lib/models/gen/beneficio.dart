class Beneficio {
  int idBeneficio;
  int idNegocio;
  int idTipoBeneficio;
  String nomBeneficio;
  bool activo;
  bool porcentual;
  double? valor;
  int orden;
  bool modificable;
  bool total;
  double? noRequiereCampania;
  String? operEstado;
  String? operFecha;
  String? operHost;
  String? operUser;

  Beneficio({
    required this.idBeneficio,
    required this.idNegocio,
    required this.idTipoBeneficio,
    required this.nomBeneficio,
    required this.activo,
    required this.porcentual,
    this.valor,
    required this.orden,
    required this.modificable,
    required this.total,
    this.noRequiereCampania,
    this.operEstado,
    this.operFecha,
    this.operHost,
    this.operUser,
  });

  factory Beneficio.fromJson(Map<String, dynamic> json) {
    return Beneficio(
      idBeneficio: json['id_beneficio'],
      idNegocio: json['id_negocio'],
      idTipoBeneficio: json['id_tipo_beneficio'],
      nomBeneficio: json['nom_beneficio'],
      activo: json['activo'],
      porcentual: json['porcentual'],
      valor: json['valor']?.toDouble(),
      orden: json['orden'],
      modificable: json['modificable'],
      total: json['total'],
      noRequiereCampania: json['no_reqiere_campaña']?.toDouble(),
      operEstado: json['oper_estado'],
      operFecha: json['oper_fecha'],
      operHost: json['oper_host'],
      operUser: json['oper_user'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_beneficio': idBeneficio,
      'id_negocio': idNegocio,
      'id_tipo_beneficio': idTipoBeneficio,
      'nom_beneficio': nomBeneficio,
      'activo': activo,
      'porcentual': porcentual,
      'valor': valor,
      'orden': orden,
      'modificable': modificable,
      'total': total,
      'no_reqiere_campaña': noRequiereCampania,
      'oper_estado': operEstado,
      'oper_fecha': operFecha,
      'oper_host': operHost,
      'oper_user': operUser,
    };
  }
}
