class VarGlobal {
  int idVarGb;
  int idEmpresa;
  String idSistema;
  String nomVarGb;
  String valor;
  String descripcion;

  VarGlobal({
    required this.idVarGb,
    required this.idEmpresa,
    required this.idSistema,
    required this.nomVarGb,
    required this.valor,
    required this.descripcion,
  });

  factory VarGlobal.fromJson(Map<String, dynamic> json) {
    return VarGlobal(
      idVarGb: json['id_var_gb'],
      idEmpresa: json['id_empresa'],
      idSistema: json['id_sistema'],
      nomVarGb: json['nom_var_gb'],
      valor: json['valor'],
      descripcion: json['descripcion'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_var_gb': idVarGb,
      'id_empresa': idEmpresa,
      'id_sistema': idSistema,
      'nom_var_gb': nomVarGb,
      'valor': valor,
      'descripcion': descripcion,
    };
  }
}
