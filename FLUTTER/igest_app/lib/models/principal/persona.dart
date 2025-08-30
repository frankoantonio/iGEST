class Persona {
  int idPersona;
  int idEmpresa;
  int idTipoPersona;
  int idTipoDocIdent;
  String numDocIdent;
  String paterno;
  String materno;
  String nombres;
  String numRucPerNat;
  String sigla;
  bool validado;

  Persona({
    required this.idPersona,
    required this.idEmpresa,
    required this.idTipoPersona,
    required this.idTipoDocIdent,
    required this.numDocIdent,
    required this.paterno,
    required this.materno,
    required this.nombres,
    required this.numRucPerNat,
    required this.sigla,
    required this.validado,
  });

  factory Persona.fromJson(Map<String, dynamic> json) {
    return Persona(
      idPersona: json['id_persona'],
      idEmpresa: json['id_empresa'],
      idTipoPersona: json['id_tipo_persona'],
      idTipoDocIdent: json['id_tipo_doc_ident'],
      numDocIdent: json['num_doc_ident'],
      paterno: json['paterno'],
      materno: json['materno'],
      nombres: json['nombres'],
      numRucPerNat: json['num_ruc_per_nat'],
      sigla: json['sigla'],
      validado: json['validado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_persona': idPersona,
      'id_empresa': idEmpresa,
      'id_tipo_persona': idTipoPersona,
      'id_tipo_doc_ident': idTipoDocIdent,
      'num_doc_ident': numDocIdent,
      'paterno': paterno,
      'materno': materno,
      'nombres': nombres,
      'num_ruc_per_nat': numRucPerNat,
      'sigla': sigla,
      'validado': validado,
    };
  }
}
