class Pais {
  int idPais;
  String nomPais;
  bool activo;
  int orden;

  Pais({
    required this.idPais,
    required this.nomPais,
    required this.activo,
    required this.orden,
  });

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
      idPais: json['id_pais'],
      nomPais: json['nom_pais'],
      activo: json['activo'],
      orden: json['orden'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_pais': idPais,
      'nom_pais': nomPais,
      'activo': activo,
      'orden': orden,
    };
  }
}
