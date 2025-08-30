import 'package:dio/dio.dart';
import 'package:igest_app/models/principal/empresa.dart';

class EmpresaService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'http://localhost/auth/test', connectTimeout: const Duration(seconds: 10), receiveTimeout: const Duration(seconds: 10)));

  Future<List<Empresa>> obtenerEmpresasPorRuc(String ruc) async {
    try {
      final response = await _dio.get('/$ruc');

      if (response.data is List) {
        return (response.data as List).map((json) => Empresa.fromJson(json)).toList();
      }

      return [];
    } catch (e) {
      throw Exception('Error al obtener empresas');
    }
  }
}
