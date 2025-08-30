class Precio {
  int idPrecio;
  int idArticulo;
  int idGrpprecio;
  double importe;
  double importeFracc;
  String idMoneda;

  Precio({
    required this.idPrecio,
    required this.idArticulo,
    required this.idGrpprecio,
    required this.importe,
    required this.importeFracc,
    required this.idMoneda,
  });

  factory Precio.fromJson(Map<String, dynamic> json) {
    return Precio(
      idPrecio: json['id_precio'],
      idArticulo: json['id_articulo'],
      idGrpprecio: json['id_grpprecio'],
      importe: json['importe'].toDouble(),
      importeFracc: json['importe_fracc'].toDouble(),
      idMoneda: json['id_moneda'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_precio': idPrecio,
      'id_articulo': idArticulo,
      'id_grpprecio': idGrpprecio,
      'importe': importe,
      'importe_fracc': importeFracc,
      'id_moneda': idMoneda,
    };
  }
}
