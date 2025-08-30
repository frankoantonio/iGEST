//import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:igest_app/models/principal/sede.dart';
import 'package:igest_app/shared/utils/vars.dart';

class SedeService {
  // Demo data
  static List<Sede> getDemoSedes() {
    return List<Sede>.generate(
      20,
      (i) => Sede.mini(
        idSede: i + 1,
        idEmpresa: 1,
        nomSede: 'Sede Central ${i + 1}',
        dirSede: 'Avenida de los Desarrolladores #${i + 1}, Flutter City',
        nomImagen: '${Vars.urlServerStorage}/igest-public/sedes/sede_${Vars.obMyUI.idEmpresa.toString()}_${i + 1}.png',
        coords: LatLng(-12.05 + (i * 0.015), -77.05 - (i * 0.005)),
      ),
    );
  }

  // Servicio real (API REST ficticio)
  static Future<List<Sede>> fetchSedesByEmpresa(int idEmpresa) async {
    // final url = Uri.parse('https://api.ejemplo.com/empresas/$idEmpresa/sedes');
    // final response = await http.get(url);
    // if (response.statusCode == 200) {
    //   final List<dynamic> data = json.decode(response.body);
    //   return data.map((json) => Sede.fromJson(json)).toList();
    // } else {
    //   throw Exception('Error al cargar las sedes');
    // }
    // si esta en blanco el nombre dela imagen de la sede, siempre poner el pode defecto ->  1004_00.png  (siemrpre debe haber eso minimmmente)
    return getDemoSedes(); // Retorna datos de demostración
  }
}
