class Distrito {
  String idDistrito;
  String idProvincia;
  String nomDistrito;
  String latitud;
  String longitud;

  Distrito({
    required this.idDistrito,
    required this.idProvincia,
    required this.nomDistrito,
    required this.latitud,
    required this.longitud,
  });

  factory Distrito.fromJson(Map<String, dynamic> json) {
    return Distrito(
      idDistrito: json['id_distrito'],
      idProvincia: json['id_provincia'],
      nomDistrito: json['nom_distrito'],
      latitud: json['latitud'],
      longitud: json['longitud'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_distrito': idDistrito,
      'id_provincia': idProvincia,
      'nom_distrito': nomDistrito,
      'latitud': latitud,
      'longitud': longitud,
    };
  }
}
