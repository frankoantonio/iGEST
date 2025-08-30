class Comprobante {
  String idComprobante;
  String nomComprobante;
  bool docInterno;

  Comprobante({
    required this.idComprobante,
    required this.nomComprobante,
    required this.docInterno,
  });

  factory Comprobante.fromJson(Map<String, dynamic> json) {
    return Comprobante(
      idComprobante: json['id_comprobante'],
      nomComprobante: json['nom_comprobante'],
      docInterno: json['doc_interno'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_comprobante': idComprobante,
      'nom_comprobante': nomComprobante,
      'doc_interno': docInterno,
    };
  }
}
