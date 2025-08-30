import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:igest_app/views/principal/config_init_page.dart';
//import 'package:web/web.dart' as web;
import 'package:igest_app/shared/utils/web_helper.dart'; // este es el import que hace la magia

import 'package:igest_app/shared/utils/log.dart';
import 'package:igest_app/shared/utils/conexion.dart';
import 'package:igest_app/shared/utils/vars.dart';
//import 'package:igest_app/shared/widgets/splash_widget.dart';
import 'package:igest_app/views/principal/error_cnx_widget.dart';
import 'package:igest_app/views/principal/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Vars.isWeb = kIsWeb;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _uiInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeUIAndRedirectIfNeeded();
  }

  void _initializeUIAndRedirectIfNeeded() {
    if (Vars.isWeb && !Vars.withSubDomain) {
      final validCodeName = _getValidCodeNameFromUri();

      if (Vars.codeNameEmpresa != validCodeName) {
        _setUI(validCodeName);
        // Vars.codeNameEmpresa = validCodeName;
        // Vars.obMyUI = InterfazUI.getInterfazUI(validCodeName);

        // Redirigir a /auth/{validCodeName} si no está ya en la URL
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final newUrl = '/auth/$validCodeName';
          // if (web.window.location.pathname != newUrl) {
          //   web.window.history.replaceState(null, 'iGEST', newUrl);
          // }
          replaceUrl('/auth/$validCodeName');

          Navigator.of(context).pushReplacementNamed(newUrl);
        });
      } else {
        _setUI(validCodeName);
      }
    } else {
      // Modo nativo o correrá en un dominio/subdominio
      _setUI(Vars.codeNameEmpresa);
    }
  }

  String _getValidCodeNameFromUri() {
    final segments = Uri.base.pathSegments;
    final codeName = (segments.length >= 2 && segments[0] == 'auth') ? segments[1] : null;
    return InterfazUI.getValidCodeName(codeName);
  }

  void _setUI(String codeName) {
    Vars.codeNameEmpresa = codeName;
    Vars.obMyUI = InterfazUI.getInterfazUI(codeName);
  }

  @override
  Widget build(BuildContext context) {
    if (_uiInitialized) {
      final validCodeName = Vars.isWeb && !Vars.withSubDomain ? _getValidCodeNameFromUri() : Vars.codeNameEmpresa;
      _setUI(validCodeName);
      _uiInitialized = true;
    }

    // if (Vars.isWeb && !Vars.withSubDomain) {
    //   final validCodeName = _getValidCodeNameFromUri();
    //   _setUI(validCodeName);
    // } else {
    //   _setUI(Vars.codeNameEmpresa);
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'iGEST',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Vars.obMyUI.colorFondoDK), useMaterial3: true),
      onGenerateRoute: _handleRoute,
      onUnknownRoute: (_) => _createHomeRoute(),
      home: const HomeScreen(),
    );
  }

  MaterialPageRoute? _handleRoute(RouteSettings settings) {
    final routeName = settings.name;
    if (routeName == null || !routeName.startsWith('/auth/')) return null;

    final parts = routeName.split('/');
    if (parts.length < 3) return null;

    final codeNameEmpresa = InterfazUI.getValidCodeName(parts[2]);
    _setUI(codeNameEmpresa);

    return _createHomeRoute(settings);
  }

  MaterialPageRoute _createHomeRoute([RouteSettings? settings]) {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: settings ?? const RouteSettings(name: '/auth/igest'),
    );
  }
} // end of MyApp

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? _isConnected;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    final result = await Conexion.validateComplete();
    if (!mounted) return;
    setState(() {
      _isConnected = result.success;
      _errorMessage = result.message;
    });
    Log.msg(result);
  }

  @override
  Widget build(BuildContext context) {
    final Widget content = switch (_isConnected) {
      null => const CircularProgressIndicator(),
      true => Vars.codeNameEmpresa == 'igest' ? const ConfigInitPage() : const LoginPage(),
      false => ErrorCnxWidget(errorMessage: _errorMessage),
    };
    return Scaffold(body: Center(child: content));
  }
}
