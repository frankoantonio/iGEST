import 'package:google_maps_flutter/google_maps_flutter.dart';

class Sede {
  int idSede;
  int idPadre;
  int idEmpresa;
  int nivel;
  int idTipoSede;
  String nomSede;
  String dirSede;
  String idDistrito;
  bool activo;
  bool sunatOficial;
  String sunatCod;
  String facEleRuta;
  String facEleToken;
  String latitud;
  String longitud;
  int orden;
  String nomImagen;
  LatLng coords;

  Sede({required this.idSede, required this.idPadre, required this.idEmpresa, required this.nivel, required this.idTipoSede, required this.nomSede, required this.dirSede, required this.idDistrito, required this.activo, required this.sunatOficial, required this.sunatCod, required this.facEleRuta, required this.facEleToken, required this.latitud, required this.longitud, required this.orden, required this.nomImagen, required this.coords});
  // Constructor reducido
  Sede.mini({required this.idSede, required this.idEmpresa, required this.nomSede, required this.dirSede, required this.nomImagen, required this.coords}) : idPadre = -1, nivel = -1, idTipoSede = -1, idDistrito = '', activo = false, sunatOficial = true, sunatCod = '', facEleRuta = '', facEleToken = '', latitud = '', longitud = '', orden = -1;

  // Sede.fromJson(Map<String, dynamic> json)
  //   : idSede = json['idSede'] ?? -1,
  //     idPadre = json['idPadre'] ?? -1,
  //     idEmpresa = json['idEmpresa'] ?? -1,
  //     nivel = json['nivel'] ?? 0,
  //     idTipoSede = json['idTipoSede'] ?? -1,
  //     nomSede = json['nomSede'] ?? '',
  //     dirSede = json['dirSede'] ?? '',
  //     idDistrito = json['idDistrito'] ?? '',
  //     activo = json['activo'] ?? false,
  //     sunatOficial = json['sunatOficial'] ?? false,
  //     sunatCod = json['sunatCod'] ?? '',
  //     facEleRuta = json['facEleRuta'] ?? '',
  //     facEleToken = json['facEleToken'] ?? '',
  //     latitud = json['latitud'] ?? '',
  //     longitud = json['longitud'] ?? '',
  //     orden = json['orden'] ?? 0,
  //     nomImagen = json['nomImagen'] ?? '',
  //     coords = LatLng(double.tryParse(json['latitud'] ?? '0') ?? 0.0, double.tryParse(json['longitud'] ?? '0') ?? 0.0);

  // Map<String, dynamic> toJson() => {'idSede': idSede, 'idPadre': idPadre, 'idEmpresa': idEmpresa, 'nivel': nivel, 'idTipoSede': idTipoSede, 'nomSede': nomSede, 'dirSede': dirSede, 'idDistrito': idDistrito, 'activo': activo, 'sunatOficial': sunatOficial, 'sunatCod': sunatCod, 'facEleRuta': facEleRuta, 'facEleToken': facEleToken, 'latitud': latitud, 'longitud': longitud, 'orden': orden, 'nomImagen': nomImagen, 'coords': coords.toJson()};
}
