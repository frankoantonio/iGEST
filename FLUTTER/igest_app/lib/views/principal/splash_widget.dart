import 'package:flutter/material.dart';
import 'package:igest_app/shared/utils/vars.dart';
import 'package:igest_app/views/principal/login_page.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> with SingleTickerProviderStateMixin {
  static const _animationDuration = Duration(seconds: 1);
  static const _transitionDuration = Duration(milliseconds: 250);

  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;
  late final Animation<int> _countAnimation;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
    _controller.forward().whenComplete(_navigateToLogin);
  }

  void _initializeAnimations() {
    _controller = AnimationController(duration: _animationDuration, vsync: this);

    final linearCurve = CurvedAnimation(parent: _controller, curve: Curves.linear);

    _scaleAnimation = Tween<double>(begin: 0.10, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _countAnimation = IntTween(begin: 0, end: 100).animate(linearCurve);
    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(linearCurve);
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const LoginPage(),
        transitionsBuilder: (_, animation, __, child) => FadeTransition(opacity: animation, child: child),
        transitionDuration: _transitionDuration,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vars.obMyUI.colorFondoDK,
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [_buildAnimatedLogo(), const SizedBox(height: 50), _buildProgressIndicator()]),
      ),
    );
  }

  Widget _buildAnimatedLogo() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Opacity(
        opacity: _opacityAnimation.value,
        child: Transform.scale(
          scale: _scaleAnimation.value,
          child: Image.asset('assets/images/logos/logo_${Vars.obMyUI.idEmpresa}.png', width: 200, height: 150, fit: BoxFit.contain),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(value: _progressAnimation.value, color: Colors.white, backgroundColor: Colors.white24, strokeWidth: 4),
          ),
          Text(
            '${_countAnimation.value}%',
            style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
