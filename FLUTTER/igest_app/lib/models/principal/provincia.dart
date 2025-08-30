class Provincia {
  String idProvincia;
  String idDepartamento;
  String nomProvincia;

  Provincia({
    required this.idProvincia,
    required this.idDepartamento,
    required this.nomProvincia,
  });

  factory Provincia.fromJson(Map<String, dynamic> json) {
    return Provincia(
      idProvincia: json['id_provincia'],
      idDepartamento: json['id_departamento'],
      nomProvincia: json['nom_provincia'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_provincia': idProvincia,
      'id_departamento': idDepartamento,
      'nom_provincia': nomProvincia,
    };
  }
}
