class ProductoProyecto {
  int idProdProy;
  int idNegocio;
  String nomProdProy;
  String tipo;
  bool ventas;
  bool planilla;
  int orden;
  bool activo;

  ProductoProyecto({
    required this.idProdProy,
    required this.idNegocio,
    required this.nomProdProy,
    required this.tipo,
    required this.ventas,
    required this.planilla,
    required this.orden,
    required this.activo,
  });

  factory ProductoProyecto.fromJson(Map<String, dynamic> json) {
    return ProductoProyecto(
      idProdProy: json['id_prod_proy'],
      idNegocio: json['id_negocio'],
      nomProdProy: json['nom_prod_proy'],
      tipo: json['tipo'],
      ventas: json['ventas'],
      planilla: json['planilla'],
      orden: json['orden'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_prod_proy': idProdProy,
      'id_negocio': idNegocio,
      'nom_prod_proy': nomProdProy,
      'tipo': tipo,
      'ventas': ventas,
      'planilla': planilla,
      'orden': orden,
      'activo': activo,
    };
  }
}
