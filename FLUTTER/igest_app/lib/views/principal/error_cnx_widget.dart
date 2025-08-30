import 'package:flutter/material.dart';

class ErrorCnxWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorCnxWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo rojo degradado
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.red.shade900, Colors.red.shade300]),
            ),
          ),

          // Contenido principal
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset('assets/images/logos/logo_error.png', width: 200, height: 150, fit: BoxFit.contain),
                  const SizedBox(height: 30),

                  // Fila con Icono y primer mensaje de error
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.error_outline, color: Colors.white, size: 40),
                      const SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          errorMessage.split('|').first.trim(),
                          style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
