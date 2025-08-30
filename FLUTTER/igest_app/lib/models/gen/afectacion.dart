class Afectacion {
  int idAfectacion;
  String nomAfectacion;
  String registro;
  int orden;
  bool activo;

  Afectacion({
    required this.idAfectacion,
    required this.nomAfectacion,
    required this.registro,
    required this.orden,
    required this.activo,
  });

  factory Afectacion.fromJson(Map<String, dynamic> json) {
    return Afectacion(
      idAfectacion: json['id_afectacion'],
      nomAfectacion: json['nom_afectacion'],
      registro: json['registro'],
      orden: json['orden'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_afectacion': idAfectacion,
      'nom_afectacion': nomAfectacion,
      'registro': registro,
      'orden': orden,
      'activo': activo,
    };
  }
}
