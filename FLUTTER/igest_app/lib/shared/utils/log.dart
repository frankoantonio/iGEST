import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

/// Clase para mostrar mensajes de depuración
class Log {
  static final Logger _logger = Logger();

  static void msg(dynamic detalles) {
    if (kDebugMode) {
      _logger.i('DEBUG_DESARROLLO - MENSAJE:\n$detalles');
    }
  }
}
