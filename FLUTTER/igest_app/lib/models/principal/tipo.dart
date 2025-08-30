class Tipo {
  int idTipo;
  String nomTipo;
  String nomCorto;
  String codOficial1;
  String codOficial2;
  String codOficial3;
  String valor1;
  String valor2;
  String clave;
  String grupo;
  int orden;
  bool activo;
  String idSistema;
  String descripcion;

  Tipo({
    required this.idTipo,
    required this.nomTipo,
    required this.nomCorto,
    required this.codOficial1,
    required this.codOficial2,
    required this.codOficial3,
    required this.valor1,
    required this.valor2,
    required this.clave,
    required this.grupo,
    required this.orden,
    required this.activo,
    required this.idSistema,
    required this.descripcion,
  });

  factory Tipo.fromJson(Map<String, dynamic> json) {
    return Tipo(
      idTipo: json['id_tipo'],
      nomTipo: json['nom_tipo'],
      nomCorto: json['nom_corto'],
      codOficial1: json['cod_oficial1'],
      codOficial2: json['cod_oficial2'],
      codOficial3: json['cod_oficial3'],
      valor1: json['valor1'],
      valor2: json['valor2'],
      clave: json['clave'],
      grupo: json['grupo'],
      orden: json['orden'],
      activo: json['activo'],
      idSistema: json['id_sistema'],
      descripcion: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_tipo': idTipo,
      'nom_tipo': nomTipo,
      'nom_corto': nomCorto,
      'cod_oficial1': codOficial1,
      'cod_oficial2': codOficial2,
      'cod_oficial3': codOficial3,
      'valor1': valor1,
      'valor2': valor2,
      'clave': clave,
      'grupo': grupo,
      'orden': orden,
      'activo': activo,
      'id_sistema': idSistema,
      'descripcion': descripcion,
    };
  }
}
