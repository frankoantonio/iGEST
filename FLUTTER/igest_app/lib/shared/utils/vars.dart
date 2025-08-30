import 'package:flutter/material.dart';
import 'package:igest_app/shared/utils/extension.dart';

// API KEY MAPAS ANDROID
// AIzaSyB8J1-fMk0NW3vRCibJfLCajAi3x_VZo3E

class Vars {
  // Servidores
  static const String urlServerAPI = 'http://localhost';  //192.168.1.51
  static const String urlServerStorage = 'https://storage.googleapis.com'; // Servidor de almacenamiento (igest-public-igest-private)
  static const String urlValInternet = 'https://cloudflare.com/cdn-cgi/trace';
  static const String urlValServerAPI = '${Vars.urlServerAPI}/auth/test';
  static const String urlValServerStorage = '$urlServerStorage/igest-public/test.png';
  // Variables generales
  static bool isWeb = false; // Indica si la aplicación se está ejecutando en un navegador web
  static bool withSubDomain = false; // Si true indica que va correr en un subdominio, si false indica que se usará parámetro 'codeName' en la URL
  static String codeNameEmpresa = 'sanjuanbosco'; // Nombre único de cada empresa, cambiarlo según la empresa que se esté usando
  static late InterfazUI obMyUI; // Colores y logo de la empresa

  // Varibles desde el servidor
  //static String? rucEmpresa;
  //static String? nombreUsuario;
  //static String? token;
  //static int? moduloActual;
}

/// Contiene información sobre la empresa sus colores y logo
class InterfazUI {
  final int idEmpresa;
  final String codeName;
  final Color colorFondoDK;
  final Color colorFondoST;
  final Color colorFondoLT;
  final Color colorLabelPri;
  final Color colorLabSec;
  final String numContacto;

  InterfazUI({required this.idEmpresa, required this.codeName, required this.colorFondoDK, required this.colorFondoST, required this.colorFondoLT, required this.colorLabelPri, required this.colorLabSec, required this.numContacto});

  // Lista de empresas
  static final List<InterfazUI> lsInterfazUI = [
    InterfazUI(idEmpresa: 1000, codeName: "igest", colorFondoDK: Colors.blueAccent, colorFondoST: Colors.white, colorFondoLT: Colors.black, colorLabelPri: Colors.white, colorLabSec: Colors.black, numContacto: ''),
    InterfazUI(idEmpresa: 1001, codeName: "yupana", colorFondoDK: "#01579b".toColor(), colorFondoST: "#039be5".toColor(), colorFondoLT: "#fff3db".toColor(), colorLabelPri: Colors.white, colorLabSec: Colors.blue.shade800, numContacto: '+51987779695'),
    InterfazUI(idEmpresa: 1002, codeName: "geraldine", colorFondoDK: Colors.white, colorFondoST: Colors.white, colorFondoLT: Colors.black, colorLabelPri: Colors.white, colorLabSec: Colors.white, numContacto: '+51987779695'),
    InterfazUI(idEmpresa: 1003, codeName: "mundodeloslibros", colorFondoDK: Colors.white, colorFondoST: Colors.white, colorFondoLT: Colors.black, colorLabelPri: Colors.white, colorLabSec: Colors.white, numContacto: '+51987779695'),
    InterfazUI(idEmpresa: 1004, codeName: "sanjuanbosco", colorFondoDK: "#0d47a1".toColor(), colorFondoST: "#1976d2".toColor(), colorFondoLT: "#e3f2fd".toColor(), colorLabelPri: Colors.white, colorLabSec: Colors.lightGreen.shade800, numContacto: '+51987779695'),
    InterfazUI(idEmpresa: 1005, codeName: "sanfernando", colorFondoDK: "#0d47a1".toColor(), colorFondoST: "#1976d2".toColor(), colorFondoLT: "#e3f2fd".toColor(), colorLabelPri: Colors.white, colorLabSec: Colors.lightGreen.shade800, numContacto: '+51987779695'),
    InterfazUI(idEmpresa: 1006, codeName: "polideportivosjb", colorFondoDK: "#0d47a1".toColor(), colorFondoST: "#1976d2".toColor(), colorFondoLT: "#e3f2fd".toColor(), colorLabelPri: Colors.white, colorLabSec: Colors.lightGreen.shade800, numContacto: '+51987779695'),
    InterfazUI(idEmpresa: 1007, codeName: "casadelniño", colorFondoDK: "#b71c1c".toColor(), colorFondoST: "#e53935".toColor(), colorFondoLT: "#ffe0db".toColor(), colorLabelPri: Colors.yellow, colorLabSec: Colors.blue, numContacto: '+51987779695'),
  ];

  // Recuperar un objeto por codeNameEmpresa
  static InterfazUI getInterfazUI(String codeNameEmpresa) {
    return lsInterfazUI.firstWhere((interfaz) => interfaz.codeName == codeNameEmpresa, orElse: () => lsInterfazUI.first);
  }

  /// Retorna el codeName si es válido, o 'igest' como valor por defecto
  static String getValidCodeName(String? codeName) {
    return (codeName != null && lsInterfazUI.any((interfaz) => interfaz.codeName == codeName)) ? codeName : 'igest';
  }
} //end of InterfazUI
