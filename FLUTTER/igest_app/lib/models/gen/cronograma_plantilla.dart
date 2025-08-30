class CronogramaPlantilla {
  int idCronPlant;
  int idCampania;
  int orden;
  String nombre;
  int numMes;
  String periodo;
  DateTime fePago;
  DateTime fePagoOrig;
  bool eliminado;

  CronogramaPlantilla({
    required this.idCronPlant,
    required this.idCampania,
    required this.orden,
    required this.nombre,
    required this.numMes,
    required this.periodo,
    required this.fePago,
    required this.fePagoOrig,
    required this.eliminado,
  });

  factory CronogramaPlantilla.fromJson(Map<String, dynamic> json) {
    return CronogramaPlantilla(
      idCronPlant: json['id_cron_plant'],
      idCampania: json['id_campania'],
      orden: json['orden'],
      nombre: json['nombre'],
      numMes: json['num_mes'],
      periodo: json['periodo'],
      fePago: DateTime.parse(json['fe_pago']),
      fePagoOrig: DateTime.parse(json['fe_pago_orig']),
      eliminado: json['eliminado'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_cron_plant': idCronPlant,
      'id_campania': idCampania,
      'orden': orden,
      'nombre': nombre,
      'num_mes': numMes,
      'periodo': periodo,
      'fe_pago': fePago.toIso8601String(),
      'fe_pago_orig': fePagoOrig.toIso8601String(),
      'eliminado': eliminado,
    };
  }
}
