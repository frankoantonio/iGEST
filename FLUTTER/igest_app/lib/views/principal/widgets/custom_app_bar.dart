import 'package:flutter/material.dart';
import 'package:igest_app/shared/utils/vars.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget returnWidget;

  const CustomAppBar({super.key, required this.title, required this.returnWidget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Vars.obMyUI.colorFondoST,
      elevation: 4,
      iconTheme: IconThemeData(color: Vars.obMyUI.colorLabelPri),

      // Botón de retroceso con navegación personalizable
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pushReplacement(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => returnWidget, // <-- Usamos el widget recibido
              transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
              transitionDuration: const Duration(milliseconds: 500),
            ),
          );
        },
      ),

      // Título con logo y texto personalizable
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/logos/logo_${Vars.obMyUI.idEmpresa}.png', width: 30, height: 30, fit: BoxFit.contain),
          const SizedBox(width: 8),
          Text(
            title, // <-- Usamos el título recibido
            style: TextStyle(color: Vars.obMyUI.colorLabelPri, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),

      titleSpacing: 0,
      centerTitle: false,
    );
  }

  // Esto es requerido por 'PreferredSizeWidget'.
  // Le dice al Scaffold qué altura debe tener nuestro AppBar.
  // kToolbarHeight es la altura estándar de un AppBar en Flutter.
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
