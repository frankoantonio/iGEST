class ProductoSunat {
  int idProdSunat;
  String tipo;
  String codigo;
  String codigoPadre;
  String nombre;
  int nivel;

  ProductoSunat({
    required this.idProdSunat,
    required this.tipo,
    required this.codigo,
    required this.codigoPadre,
    required this.nombre,
    required this.nivel,
  });

  factory ProductoSunat.fromJson(Map<String, dynamic> json) {
    return ProductoSunat(
      idProdSunat: json['id_prod_sunat'],
      tipo: json['tipo'],
      codigo: json['codigo'],
      codigoPadre: json['codigo_padre'],
      nombre: json['nombre'],
      nivel: json['nivel'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_prod_sunat': idProdSunat,
      'tipo': tipo,
      'codigo': codigo,
      'codigo_padre': codigoPadre,
      'nombre': nombre,
      'nivel': nivel,
    };
  }
}
