class Venta {
  int idVenta;
  int idNegocio;
  int idLocal;
  String idComprobante;
  String serie;
  int numero;
  int idCliente;
  String idTidocident;
  String numDocident;
  int idBeneficiario;
  int idInscripcion;
  double dsctoGb;
  double cargoGb;
  double importeTt;
  double descuentoTt;
  double netoTt;
  double exoneradoTt;
  double inafectoTt;
  double gravadoTt;
  double igvTt;
  double saldoTt;
  DateTime feEmite;
  DateTime? feCancela;
  String estado;
  bool credito;
  String idMoneda;
  int idNotacred;
  String obs;

  Venta({
    required this.idVenta,
    required this.idNegocio,
    required this.idLocal,
    required this.idComprobante,
    required this.serie,
    required this.numero,
    required this.idCliente,
    required this.idTidocident,
    required this.numDocident,
    required this.idBeneficiario,
    required this.idInscripcion,
    required this.dsctoGb,
    required this.cargoGb,
    required this.importeTt,
    required this.descuentoTt,
    required this.netoTt,
    required this.exoneradoTt,
    required this.inafectoTt,
    required this.gravadoTt,
    required this.igvTt,
    required this.saldoTt,
    required this.feEmite,
    this.feCancela,
    required this.estado,
    required this.credito,
    required this.idMoneda,
    required this.idNotacred,
    required this.obs,
  });

  factory Venta.fromJson(Map<String, dynamic> json) {
    return Venta(
      idVenta: json['id_venta'],
      idNegocio: json['id_negocio'],
      idLocal: json['id_local'],
      idComprobante: json['id_comprobante'],
      serie: json['serie'],
      numero: json['numero'],
      idCliente: json['id_cliente'],
      idTidocident: json['id_tidocident'],
      numDocident: json['num_docident'],
      idBeneficiario: json['id_beneficiario'],
      idInscripcion: json['id_inscripcion'],
      dsctoGb: json['dscto_gb'].toDouble(),
      cargoGb: json['cargo_gb'].toDouble(),
      importeTt: json['importe_tt'].toDouble(),
      descuentoTt: json['descuento_tt'].toDouble(),
      netoTt: json['neto_tt'].toDouble(),
      exoneradoTt: json['exonerado_tt'].toDouble(),
      inafectoTt: json['inafecto_tt'].toDouble(),
      gravadoTt: json['gravado_tt'].toDouble(),
      igvTt: json['igv_tt'].toDouble(),
      saldoTt: json['saldo_tt'].toDouble(),
      feEmite: DateTime.parse(json['fe_emite']),
      feCancela: json['fe_cancela'] != null ? DateTime.parse(json['fe_cancela']) : null,
      estado: json['estado'],
      credito: json['credito'],
      idMoneda: json['id_moneda'],
      idNotacred: json['id_notacred'],
      obs: json['obs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_venta': idVenta,
      'id_negocio': idNegocio,
      'id_local': idLocal,
      'id_comprobante': idComprobante,
      'serie': serie,
      'numero': numero,
      'id_cliente': idCliente,
      'id_tidocident': idTidocident,
      'num_docident': numDocident,
      'id_beneficiario': idBeneficiario,
      'id_inscripcion': idInscripcion,
      'dscto_gb': dsctoGb,
      'cargo_gb': cargoGb,
      'importe_tt': importeTt,
      'descuento_tt': descuentoTt,
      'neto_tt': netoTt,
      'exonerado_tt': exoneradoTt,
      'inafecto_tt': inafectoTt,
      'gravado_tt': gravadoTt,
      'igv_tt': igvTt,
      'saldo_tt': saldoTt,
      'fe_emite': feEmite.toIso8601String(),
      'fe_cancela': feCancela?.toIso8601String(),
      'estado': estado,
      'credito': credito,
      'id_moneda': idMoneda,
      'id_notacred': idNotacred,
      'obs': obs,
    };
  }
}
