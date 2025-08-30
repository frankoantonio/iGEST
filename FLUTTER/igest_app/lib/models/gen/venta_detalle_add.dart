class VentaDetalleAdd {
  int idVentadetadd;
  int idVentadet;
  int colId;
  String col1Key;
  String col1Value;
  String col2Key;
  String col2Value;

  VentaDetalleAdd({
    required this.idVentadetadd,
    required this.idVentadet,
    required this.colId,
    required this.col1Key,
    required this.col1Value,
    required this.col2Key,
    required this.col2Value,
  });

  factory VentaDetalleAdd.fromJson(Map<String, dynamic> json) {
    return VentaDetalleAdd(
      idVentadetadd: json['id_ventadetadd'],
      idVentadet: json['id_ventadet'],
      colId: json['col_id'],
      col1Key: json['col1_key'],
      col1Value: json['col1_value'],
      col2Key: json['col2_key'],
      col2Value: json['col2_value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_ventadetadd': idVentadetadd,
      'id_ventadet': idVentadet,
      'col_id': colId,
      'col1_key': col1Key,
      'col1_value': col1Value,
      'col2_key': col2Key,
      'col2_value': col2Value,
    };
  }
}
