class AlmacenArticulo {
  int idAlmart;
  int idAlmacen;
  int idArticulo;
  int stock;
  int stockFracc;

  AlmacenArticulo({
    required this.idAlmart,
    required this.idAlmacen,
    required this.idArticulo,
    required this.stock,
    required this.stockFracc,
  });

  factory AlmacenArticulo.fromJson(Map<String, dynamic> json) {
    return AlmacenArticulo(
      idAlmart: json['id_almart'],
      idAlmacen: json['id_almacen'],
      idArticulo: json['id_articulo'],
      stock: json['stock'],
      stockFracc: json['stock_fracc'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_almart': idAlmart,
      'id_almacen': idAlmacen,
      'id_articulo': idArticulo,
      'stock': stock,
      'stock_fracc': stockFracc,
    };
  }
}
