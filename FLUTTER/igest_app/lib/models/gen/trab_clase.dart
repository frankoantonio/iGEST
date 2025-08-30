class TrabClase {
  int idTrabClase;
  int idEmpresa;
  int idTipoCatTrab;
  String catTrab;
  int idTipoTipTrab;
  String tipTrab;
  int idTipoCeCosto;
  String ceCosto;
  String nomTrabClase;
  bool activo;
  int orden;

  TrabClase({
    required this.idTrabClase,
    required this.idEmpresa,
    required this.idTipoCatTrab,
    required this.catTrab,
    required this.idTipoTipTrab,
    required this.tipTrab,
    required this.idTipoCeCosto,
    required this.ceCosto,
    required this.nomTrabClase,
    required this.activo,
    required this.orden,
  });

  factory TrabClase.fromJson(Map<String, dynamic> json) {
    return TrabClase(
      idTrabClase: json['id_trab_clase'],
      idEmpresa: json['id_empresa'],
      idTipoCatTrab: json['id_tipo_cat_trab'],
      catTrab: json['cat_trab'],
      idTipoTipTrab: json['id_tipo_tip_trab'],
      tipTrab: json['tip_trab'],
      idTipoCeCosto: json['id_tipo_ce_costo'],
      ceCosto: json['ce_costo'],
      nomTrabClase: json['nom_trab_clase'],
      activo: json['activo'],
      orden: json['orden'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_trab_clase': idTrabClase,
      'id_empresa': idEmpresa,
      'id_tipo_cat_trab': idTipoCatTrab,
      'cat_trab': catTrab,
      'id_tipo_tip_trab': idTipoTipTrab,
      'tip_trab': tipTrab,
      'id_tipo_ce_costo': idTipoCeCosto,
      'ce_costo': ceCosto,
      'nom_trab_clase': nomTrabClase,
      'activo': activo,
      'orden': orden,
    };
  }
}
