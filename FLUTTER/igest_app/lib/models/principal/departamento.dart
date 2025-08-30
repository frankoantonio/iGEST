class Departamento {
  String idDepartamento;
  int idPais;
  String nomDepartamento;

  Departamento({
    required this.idDepartamento,
    required this.idPais,
    required this.nomDepartamento,
  });

  factory Departamento.fromJson(Map<String, dynamic> json) {
    return Departamento(
      idDepartamento: json['id_departamento'],
      idPais: json['id_pais'],
      nomDepartamento: json['nom_departamento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_departamento': idDepartamento,
      'id_pais': idPais,
      'nom_departamento': nomDepartamento,
    };
  }
}
