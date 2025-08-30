class VentaDetalle {
  int idVentadet;
  int idVenta;
  int idArticulo;
  int mesProg;
  String nombre;
  String unMed;
  int cantidad;
  double precio;
  double descuento;
  double importe;
  double igv;
  double sub;

  VentaDetalle({
    required this.idVentadet,
    required this.idVenta,
    required this.idArticulo,
    required this.mesProg,
    required this.nombre,
    required this.unMed,
    required this.cantidad,
    required this.precio,
    required this.descuento,
    required this.importe,
    required this.igv,
    required this.sub,
  });

  factory VentaDetalle.fromJson(Map<String, dynamic> json) {
    return VentaDetalle(
      idVentadet: json['id_ventadet'],
      idVenta: json['id_venta'],
      idArticulo: json['id_articulo'],
      mesProg: json['mes_prog'],
      nombre: json['nombre'],
      unMed: json['un_med'],
      cantidad: json['cantidad'],
      precio: json['precio'].toDouble(),
      descuento: json['descuento'].toDouble(),
      importe: json['importe'].toDouble(),
      igv: json['igv'].toDouble(),
      sub: json['sub'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_ventadet': idVentadet,
      'id_venta': idVenta,
      'id_articulo': idArticulo,
      'mes_prog': mesProg,
      'nombre': nombre,
      'un_med': unMed,
      'cantidad': cantidad,
      'precio': precio,
      'descuento': descuento,
      'importe': importe,
      'igv': igv,
      'sub': sub,
    };
  }
}
