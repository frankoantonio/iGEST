import 'package:flutter/material.dart';
import 'package:igest_app/services/principal/empresa_service.dart';
import 'package:igest_app/shared/utils/log.dart';
import 'package:igest_app/models/principal/empresa.dart';

class ConfigInitProvider with ChangeNotifier {
  final EmpresaService _empresaService = EmpresaService();

  // Estado
  List<Empresa> _empresas = [];
  Empresa? _selectedEmpresa;
  bool _isLoading = false;
  String? _errorMessage;
  bool _isRucFieldEnabled = true;
  String _rucText = '';

  // Getters
  List<Empresa> get empresas => _empresas;
  Empresa? get selectedEmpresa => _selectedEmpresa;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get isRucFieldEnabled => _isRucFieldEnabled;
  String get rucText => _rucText;

  bool get canContinue => !_isLoading && _empresas.isNotEmpty && (_empresas.length == 1 || _selectedEmpresa != null);

  // Setters
  void setRucText(String value) {
    _rucText = value;
    notifyListeners();
  }

  void setSelectedEmpresa(Empresa? empresa) {
    _selectedEmpresa = empresa;
    notifyListeners();
  }

  // Validación RUC
  String? validateRuc(String? value) {
    if (value == null || value.isEmpty) return 'Se requiere un número de RUC.';
    if (!RegExp(r'^\d{11}$').hasMatch(value)) return 'Solo escribe números.';
    if (value.length != 11) return 'El RUC debe tener 11 dígitos.';
    return null;
  }

  // Verificar RUC
  Future<void> verificarRuc() async {
    if (_rucText.isEmpty || _rucText.length != 11) {
      _errorMessage = 'El RUC debe tener 11 dígitos.';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final empresas = await _empresaService.obtenerEmpresasPorRuc(_rucText.trim());
      Log.msg('Empresas obtenidas: ${empresas.length}');

      if (empresas.isEmpty) {
        _errorMessage = 'No se encontraron empresas con el RUC ingresado.';
        _empresas = [];
        _selectedEmpresa = null;
        _isRucFieldEnabled = true;
      } else {
        _empresas = empresas;
        _selectedEmpresa = empresas.length == 1 ? empresas.first : null;
        _isRucFieldEnabled = false; // Deshabilitar si encontró empresas
      }
    } catch (e) {
      Log.msg('Error al verificar RUC: $e');
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
      _empresas = [];
      _selectedEmpresa = null;
      _isRucFieldEnabled = true; // Mantener habilitado en caso de error
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Continuar con la empresa seleccionada
  Empresa? continuar() {
    final empresa = _selectedEmpresa ?? (_empresas.length == 1 ? _empresas.first : null);
    if (empresa != null) {
      Log.msg('RUC: $_rucText - Empresa: ${empresa.nomComercial}');
    }
    return empresa;
  }

  // Reiniciar estado para permitir nueva búsqueda
  void reset() {
    _empresas = [];
    _selectedEmpresa = null;
    _isLoading = false;
    _errorMessage = null;
    _isRucFieldEnabled = true;
    _rucText = '';
    notifyListeners();
  }

  // Habilitar edición del RUC
  void enableRucField() {
    _isRucFieldEnabled = true;
    _empresas = [];
    _selectedEmpresa = null;
    _errorMessage = null;
    notifyListeners();
  }
}
