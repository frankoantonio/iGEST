class Sistema {
  String idSistema;
  String nomSistema;
  String nomCorto;
  String descripcion;
  int orden;

  Sistema({
    required this.idSistema,
    required this.nomSistema,
    required this.nomCorto,
    required this.descripcion,
    required this.orden,
  });

  factory Sistema.fromJson(Map<String, dynamic> json) {
    return Sistema(
      idSistema: json['id_sistema'],
      nomSistema: json['nom_sistema'],
      nomCorto: json['nom_corto'],
      descripcion: json['descripcion'],
      orden: json['orden'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_sistema': idSistema,
      'nom_sistema': nomSistema,
      'nom_corto': nomCorto,
      'descripcion': descripcion,
      'orden': orden,
    };
  }
}
