class CarreraProf {
  int idCarrProf;
  int idNegocio;
  String nomCarrProf;
  int idAreaProf;
  int orden;
  bool visible;

  CarreraProf({
    required this.idCarrProf,
    required this.idNegocio,
    required this.nomCarrProf,
    required this.idAreaProf,
    required this.orden,
    required this.visible,
  });

  factory CarreraProf.fromJson(Map<String, dynamic> json) {
    return CarreraProf(
      idCarrProf: json['id_carr_prof'],
      idNegocio: json['id_negocio'],
      nomCarrProf: json['nom_carr_prof'],
      idAreaProf: json['id_area_prof'],
      orden: json['orden'],
      visible: json['visible'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_carr_prof': idCarrProf,
      'id_negocio': idNegocio,
      'nom_carr_prof': nomCarrProf,
      'id_area_prof': idAreaProf,
      'orden': orden,
      'visible': visible,
    };
  }
}
