import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:igest_app/shared/utils/vars.dart';

/// Clase auxiliar para entregar el resultado de validar conexión
class CnxRpta {
  final bool success;
  final String message;

  const CnxRpta({required this.success, required this.message});

  @override
  String toString() => 'Resultado(success: $success, mensaje: $message)';
}

/// Enumeración para los tipos de validar conectividad (Internet, Application Server, Storage Server)
enum CnxTypesVal {
  internet('Internet'),
  serverApi('Application Server'),
  cloudStorage('Storage Server'),
  complete('Full Server');

  const CnxTypesVal(this.label);
  final String label;
}

/// Clase que proporciona funcionalidad para verificar conectividad
class Conexion {
  static const _timeout = Duration(seconds: 4);
  static final Dio _dio = _initDio();

  static Dio _initDio() {
    final dio = Dio(BaseOptions(connectTimeout: _timeout, receiveTimeout: _timeout, followRedirects: false, method: 'GET'));
    if (!Vars.isWeb) {
      dio.httpClientAdapter = IOHttpClientAdapter(
        createHttpClient: () {
          final client = HttpClient();
          client.badCertificateCallback = (cert, host, port) => true;
          return client;
        },
      );
    }
    return dio;
  }

  static Future<CnxRpta> _verificar(String url, CnxTypesVal tipo) async {
    try {
      final response = await _dio.get(url);
      final ok = response.statusCode != null && response.statusCode! < 400;
      return CnxRpta(success: ok, message: ' ${ok ? "Conexión OK" : "Falló la conexión a"} [${tipo.label}] [${response.statusCode}] | $url');
    } on DioException catch (e) {
      return CnxRpta(success: false, message: '${_mensajeError(tipo, e)} | $url');
    } catch (e) {
      return CnxRpta(success: false, message: 'Error completamente inesperado en [${tipo.label}] | ${e.toString()} | $url');
    }
  }

  /// Método que valida conectividad al Internet, API Server, y Cloud Storage
  static Future<CnxRpta> validateComplete() async {
    final internet = await _verificar(Vars.urlValInternet, CnxTypesVal.internet);
    if (!internet.success) return internet;

    final api = await _verificar(Vars.urlValServerAPI, CnxTypesVal.serverApi);
    if (!api.success) return api;

    final storage = await _verificar(Vars.urlValServerStorage, CnxTypesVal.cloudStorage);
    if (!storage.success) return storage;

    return CnxRpta(success: true, message: 'Todo OK al validar [${CnxTypesVal.complete.label}]');
  }

  static String _mensajeError(CnxTypesVal t, DioException e) {
    final tipo = switch (e.type) {
      DioExceptionType.connectionError => 'No se pudo establecer conexión a',
      DioExceptionType.connectionTimeout => 'Se agotó el tiempo de espera al intentar conectar a',
      DioExceptionType.sendTimeout => 'Tiempo de espera agotado al enviar datos a',
      DioExceptionType.receiveTimeout => 'Tiempo de espera agotado al recibir respuesta de',
      DioExceptionType.badResponse => 'Se recibió una respuesta inválida de',
      DioExceptionType.badCertificate => 'El certificado del servidor no es válido en',
      DioExceptionType.cancel => 'La conexión fue cancelada en',
      DioExceptionType.unknown || _ => 'Se produjo un error desconocido en',
    };
    return '$tipo [${t.label}] | ${e.message}';
  }
}
