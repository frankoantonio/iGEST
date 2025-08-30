import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:igest_app/shared/utils/utils.dart';
import 'package:igest_app/shared/utils/vars.dart';
import 'package:igest_app/views/principal/widgets/controls/button_widget.dart';
import 'package:igest_app/views/principal/register_widget.dart';
import 'package:igest_app/views/principal/ubicanos_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:igest_app/views/principal/widgets/controls/text_form_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ──────────────────────────────────────────
  // Estados y controladores
  // ──────────────────────────────────────────
  //bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  // ──────────────────────────────────────────
  // Ciclo de vida
  // ──────────────────────────────────────────
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // ──────────────────────────────────────────
  // Métodos de negocio
  // ──────────────────────────────────────────
  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_usernameController.text == 'fbarzola' && _passwordController.text == 'Valores@123') {
        _navigateToUbicanos();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Credenciales incorrectas')));
      }
    }
  }

  void _navigateToUbicanos() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const UbicanosPage()));
  }

  Future<void> _contactUs() async {
    final raw = Vars.obMyUI.numContacto;
    final phone = raw.replaceAll(RegExp(r'[^\d+]'), '');
    final Uri waUri = kIsWeb ? Uri.parse('https://wa.me/$phone') : Uri.parse('whatsapp://send?phone=$phone');

    if (await canLaunchUrl(waUri)) {
      await launchUrl(waUri, mode: LaunchMode.externalApplication);
      return;
    }

    if (!kIsWeb) {
      final telUri = Uri(scheme: 'tel', path: phone);
      if (await canLaunchUrl(telUri)) {
        await launchUrl(telUri);
        return;
      }
    }

    // if (mounted) {
    //   Conexion.showSnack(context, 'No se pudo iniciar el contacto.');
    // }
  }

  void _showRegisterModal() {
    showModalBottomSheet(context: context, isScrollControlled: true, backgroundColor: Colors.transparent, builder: (_) => RegisterWidget());
  }

  // ──────────────────────────────────────────
  // Helpers para dimensiones
  // ──────────────────────────────────────────
  double _getFormWidth(double screenWidth) {
    if (screenWidth < 370) {
      return 350; // Ancho fijo para activar scroll horizontal
    }
    if (screenWidth < 400) {
      return screenWidth * 0.9;
    }
    return 400;
  }

  // ──────────────────────────────────────────
  // Construcción de la vista
  // ──────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final formWidth = _getFormWidth(screenWidth);
    final labelColor = Vars.obMyUI.colorFondoDK;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Fondo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/fondos/fondo_${Vars.obMyUI.idEmpresa}.png'), fit: BoxFit.cover),
            ),
          ),
          // Contenido
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: _getFormWidth(screenWidth),
                    constraints: const BoxConstraints(minWidth: 320),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
                    decoration: BoxDecoration(
                      color: Vars.obMyUI.colorFondoLT,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white.withValues(alpha: 0.2), width: 1.5),
                    ),
                    child: _buildForm(labelColor),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Formulario
  // ──────────────────────────────────────────
  Widget _buildForm(Color labelColor) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Logo
          Image.asset('assets/images/logos/logo_${Vars.obMyUI.idEmpresa}.png', width: 120, height: 90, fit: BoxFit.contain),
          const SizedBox(height: 30),

          // Usuario
          // TextFormField(
          //   controller: _usernameController,
          //   style: TextStyle(color: labelColor),
          //   decoration: _inputDecoration(label: 'Usuario', icon: Icons.person, labelColor: labelColor),
          //   validator: _validateRequired,
          // ),
          TextFormFieldWidget(
            controller: _usernameController,
            //////////////////labelTextColor: Colors.yellow,
            label: 'Usuario',
            icon: Icons.person,
            //style: TextStyle(color: labelColor),
            // decoration: _inputDecoration(label: 'Usuario', icon: Icons.person, labelColor: labelColor),
            validator: _validateRequired,
          ),

          const SizedBox(height: 20),

          // Contraseña
          // TextFormField(
          //   controller: _passwordController,
          //   obscureText: _obscurePassword,
          //   style: TextStyle(color: labelColor),
          //   decoration: _inputDecoration(
          //     label: 'Contraseña',
          //     icon: Icons.lock,
          //     labelColor: labelColor,
          //     suffix: IconButton(
          //       icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off, color: labelColor),
          //       onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
          //     ),
          //   ),
          //   validator: _validateRequired,
          // ),
          TextFormFieldWidget(controller: _passwordController, label: 'Contraseña', icon: Icons.lock, isPwd: true, validator: _validateRequired),
          const SizedBox(height: 20),

          // Botones de recuperación/registro
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 10,
            children: [
              ButtonWidget(text: 'Olvidé mi contraseña', icon: Icons.lock_reset, type: ButtonType.text, onPressed: _showRegisterModal),
              ButtonWidget(text: 'Regístrese', icon: Icons.app_registration, type: ButtonType.text, onPressed: _showRegisterModal),
            ],
          ),
          const SizedBox(height: 30),

          // Botón principal
          ButtonWidget(text: 'INGRESAR', icon: Icons.login, type: ButtonType.elevated, onPressed: _login, width: 150),
          const SizedBox(height: 50),

          // Botones inferiores
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonWidget(text: 'Ubícanos', icon: Icons.location_on, type: ButtonType.outlined, width: 140, onPressed: _navigateToUbicanos),
              ButtonWidget(text: 'Contáctanos', icon: Icons.phone, type: ButtonType.filled, width: 140, onPressed: _contactUs),
            ],
          ),
        ],
      ),
    );
  }

  // ──────────────────────────────────────────
  // Helpers
  // ──────────────────────────────────────────
  String? _validateRequired(String? value) {
    if (value == null || value.isEmpty) {
      return 'Este campo es requerido';
    }
    if (value.length < 6) {
      return 'Mínimo 6 caracteres';
    }
    return null;
  }

  // InputDecoration _inputDecoration({required String label, required IconData icon, required Color labelColor, Widget? suffix}) {
  //   return InputDecoration(
  //     labelText: label,
  //     labelStyle: TextStyle(color: labelColor.withValues(alpha: 0.7)),
  //     prefixIcon: Icon(icon, color: labelColor),
  //     suffixIcon: suffix,
  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
  //     enabledBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(10),
  //       borderSide: BorderSide(color: labelColor.withValues(alpha: 0.3)),
  //     ),
  //     focusedBorder: OutlineInputBorder(
  //       borderRadius: BorderRadius.circular(10),
  //       borderSide: BorderSide(color: Vars.obMyUI.colorFondoDK),
  //     ),
  //   );
  // }
}
