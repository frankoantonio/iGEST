class Articulo {
  int idArticulo;
  int idCategoria;
  int idAfectacion;
  bool venta;
  bool compra;
  String codInterno;
  int idProdSunat;
  String subCategoria;
  String nomArticulo;
  String marca;
  String modelo;
  String descripcion;
  bool activo;
  String undMed;
  bool validado;
  int fraccion;
  String tipo;
  double precioConIgv;
  double precioConIgvFr;
  int idNegocio;
  int idEmpresa;
  bool editPrecio;
  bool patrimonio;
  int stock;
  int stockFr;
  String undMoneda;

  Articulo({
    required this.idArticulo,
    required this.idCategoria,
    required this.idAfectacion,
    required this.venta,
    required this.compra,
    required this.codInterno,
    required this.idProdSunat,
    required this.subCategoria,
    required this.nomArticulo,
    required this.marca,
    required this.modelo,
    required this.descripcion,
    required this.activo,
    required this.undMed,
    required this.validado,
    required this.fraccion,
    required this.tipo,
    required this.precioConIgv,
    required this.precioConIgvFr,
    required this.idNegocio,
    required this.idEmpresa,
    required this.editPrecio,
    required this.patrimonio,
    required this.stock,
    required this.stockFr,
    required this.undMoneda,
  });

  factory Articulo.fromJson(Map<String, dynamic> json) {
    return Articulo(
      idArticulo: json['id_articulo'],
      idCategoria: json['id_categoria'],
      idAfectacion: json['id_afectacion'],
      venta: json['venta'],
      compra: json['compra'],
      codInterno: json['cod_interno'],
      idProdSunat: json['id_prod_sunat'],
      subCategoria: json['sub_categoria'],
      nomArticulo: json['nom_articulo'],
      marca: json['marca'],
      modelo: json['modelo'],
      descripcion: json['descripcion'],
      activo: json['activo'],
      undMed: json['und_med'],
      validado: json['validado'],
      fraccion: json['fraccion'],
      tipo: json['tipo'],
      precioConIgv: json['precio_con_igv'].toDouble(),
      precioConIgvFr: json['precio_con_igv_fr'].toDouble(),
      idNegocio: json['id_negocio'],
      idEmpresa: json['id_empresa'],
      editPrecio: json['edit_precio'],
      patrimonio: json['patrimonio'],
      stock: json['stock'],
      stockFr: json['stock_fr'],
      undMoneda: json['und_moneda'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_articulo': idArticulo,
      'id_categoria': idCategoria,
      'id_afectacion': idAfectacion,
      'venta': venta,
      'compra': compra,
      'cod_interno': codInterno,
      'id_prod_sunat': idProdSunat,
      'sub_categoria': subCategoria,
      'nom_articulo': nomArticulo,
      'marca': marca,
      'modelo': modelo,
      'descripcion': descripcion,
      'activo': activo,
      'und_med': undMed,
      'validado': validado,
      'fraccion': fraccion,
      'tipo': tipo,
      'precio_con_igv': precioConIgv,
      'precio_con_igv_fr': precioConIgvFr,
      'id_negocio': idNegocio,
      'id_empresa': idEmpresa,
      'edit_precio': editPrecio,
      'patrimonio': patrimonio,
      'stock': stock,
      'stock_fr': stockFr,
      'und_moneda': undMoneda,
    };
  }
}
