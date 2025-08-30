class EmpresaSistema {
  int? idEmpSis;
  int? idEmpresa;
  String? idSistema;
  bool? activo;
  bool? soloLectura;
  int? idTipoEdition;

  EmpresaSistema({
    this.idEmpSis,
    this.idEmpresa,
    this.idSistema,
    this.activo,
    this.soloLectura,
    this.idTipoEdition,
  });

  EmpresaSistema.fromJson(Map<String, dynamic> json)
      : idEmpSis = json['idEmpSis'],
        idEmpresa = json['idEmpresa'],
        idSistema = json['idSistema'],
        activo = json['activo'],
        soloLectura = json['soloLectura'],
        idTipoEdition = json['idTipoEdition'];

  Map<String, dynamic> toJson() => {
        'idEmpSis': idEmpSis,
        'idEmpresa': idEmpresa,
        'idSistema': idSistema,
        'activo': activo,
        'soloLectura': soloLectura,
        'idTipoEdition': idTipoEdition,
      };

  EmpresaSistema copyWith({
    int? idEmpSis,
    int? idEmpresa,
    String? idSistema,
    bool? activo,
    bool? soloLectura,
    int? idTipoEdition,
  }) {
    return EmpresaSistema(
      idEmpSis: idEmpSis ?? this.idEmpSis,
      idEmpresa: idEmpresa ?? this.idEmpresa,
      idSistema: idSistema ?? this.idSistema,
      activo: activo ?? this.activo,
      soloLectura: soloLectura ?? this.soloLectura,
      idTipoEdition: idTipoEdition ?? this.idTipoEdition,
    );
  }
}
