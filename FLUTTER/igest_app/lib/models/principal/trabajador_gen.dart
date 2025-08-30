class TrabajadorGen {
  int idTrabajador;
  int idTipoSexo;
  int idTipoEstCivil;
  int idTipoVivienda;
  int idTipoVivMaterial;
  int idTipoVivCondicion;
  int idDireccion;
  int idTipoMovilidad;
  int idTipoSitEdu;
  int idInstEgreso;
  int idTipoTitulo;
  String profesion;
  String ocupacion;
  String correoPer;
  String correoLab;
  String celularPer;
  String celularLab;
  String telefono;
  String obs;
  bool activo;

  TrabajadorGen({
    required this.idTrabajador,
    required this.idTipoSexo,
    required this.idTipoEstCivil,
    required this.idTipoVivienda,
    required this.idTipoVivMaterial,
    required this.idTipoVivCondicion,
    required this.idDireccion,
    required this.idTipoMovilidad,
    required this.idTipoSitEdu,
    required this.idInstEgreso,
    required this.idTipoTitulo,
    required this.profesion,
    required this.ocupacion,
    required this.correoPer,
    required this.correoLab,
    required this.celularPer,
    required this.celularLab,
    required this.telefono,
    required this.obs,
    required this.activo,
  });

  factory TrabajadorGen.fromJson(Map<String, dynamic> json) {
    return TrabajadorGen(
      idTrabajador: json['id_trabajador'],
      idTipoSexo: json['id_tipo_sexo'],
      idTipoEstCivil: json['id_tipo_est_civil'],
      idTipoVivienda: json['id_tipo_vivienda'],
      idTipoVivMaterial: json['id_tipo_viv_material'],
      idTipoVivCondicion: json['id_tipo_viv_condicion'],
      idDireccion: json['id_direccion'],
      idTipoMovilidad: json['id_tipo_movilidad'],
      idTipoSitEdu: json['id_tipo_sit_edu'],
      idInstEgreso: json['id_inst_egreso'],
      idTipoTitulo: json['id_tipo_titulo'],
      profesion: json['profesion'],
      ocupacion: json['ocupacion'],
      correoPer: json['correo_per'],
      correoLab: json['correo_lab'],
      celularPer: json['celular_per'],
      celularLab: json['celular_lab'],
      telefono: json['telefono'],
      obs: json['obs'],
      activo: json['activo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_trabajador': idTrabajador,
      'id_tipo_sexo': idTipoSexo,
      'id_tipo_est_civil': idTipoEstCivil,
      'id_tipo_vivienda': idTipoVivienda,
      'id_tipo_viv_material': idTipoVivMaterial,
      'id_tipo_viv_condicion': idTipoVivCondicion,
      'id_direccion': idDireccion,
      'id_tipo_movilidad': idTipoMovilidad,
      'id_tipo_sit_edu': idTipoSitEdu,
      'id_inst_egreso': idInstEgreso,
      'id_tipo_titulo': idTipoTitulo,
      'profesion': profesion,
      'ocupacion': ocupacion,
      'correo_per': correoPer,
      'correo_lab': correoLab,
      'celular_per': celularPer,
      'celular_lab': celularLab,
      'telefono': telefono,
      'obs': obs,
      'activo': activo,
    };
  }
}
