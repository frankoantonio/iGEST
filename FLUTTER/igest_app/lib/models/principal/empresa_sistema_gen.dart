class EmpresaSistemaGen {
  int idEmpSis;
  int idEmpresa;
  String idSistema;
  bool activo;

  EmpresaSistemaGen({
    required this.idEmpSis,
    required this.idEmpresa,
    required this.idSistema,
    required this.activo,
  });

  factory EmpresaSistemaGen.fromJson(Map<String, dynamic> json) {
    return EmpresaSistemaGen(
      idEmpSis: json['id_emp_sis'],
      idEmpresa: json['id_empresa'],
      idSistema: json['id_sistema'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_emp_sis': idEmpSis,
      'id_empresa': idEmpresa,
      'id_sistema': idSistema,
      'activo': activo,
    };
  }
}
