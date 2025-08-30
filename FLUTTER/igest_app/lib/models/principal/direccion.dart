class Direccion {
  int idDireccion;
  bool corrido;
  int idTipoVia;
  String nomTipoVia;
  String nomVia;
  int idTipoZona;
  String nomTipoZona;
  String nomZona;
  String referencia;
  int idPais;
  String idDistrito;
  String latitud;
  String longitud;
  int idEmpresa;

  Direccion({
    required this.idDireccion,
    required this.corrido,
    required this.idTipoVia,
    required this.nomTipoVia,
    required this.nomVia,
    required this.idTipoZona,
    required this.nomTipoZona,
    required this.nomZona,
    required this.referencia,
    required this.idPais,
    required this.idDistrito,
    required this.latitud,
    required this.longitud,
    required this.idEmpresa,
  });

  factory Direccion.fromJson(Map<String, dynamic> json) {
    return Direccion(
      idDireccion: json['id_direccion'],
      corrido: json['corrido'],
      idTipoVia: json['id_tipo_via'],
      nomTipoVia: json['nom_tipo_via'],
      nomVia: json['nom_via'],
      idTipoZona: json['id_tipo_zona'],
      nomTipoZona: json['nom_tipo_zona'],
      nomZona: json['nom_zona'],
      referencia: json['referencia'],
      idPais: json['id_pais'],
      idDistrito: json['id_distrito'],
      latitud: json['latitud'],
      longitud: json['longitud'],
      idEmpresa: json['id_empresa'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_direccion': idDireccion,
      'corrido': corrido,
      'id_tipo_via': idTipoVia,
      'nom_tipo_via': nomTipoVia,
      'nom_via': nomVia,
      'id_tipo_zona': idTipoZona,
      'nom_tipo_zona': nomTipoZona,
      'nom_zona': nomZona,
      'referencia': referencia,
      'id_pais': idPais,
      'id_distrito': idDistrito,
      'latitud': latitud,
      'longitud': longitud,
      'id_empresa': idEmpresa,
    };
  }
}
