// OK AL 06-JULIO
import 'dart:io' show Platform;
import 'dart:math' as math;

import 'package:flutter/foundation.dart' show Factory, kIsWeb;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:igest_app/shared/utils/vars.dart';
import 'package:igest_app/views/principal/widgets/sede_card_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:igest_app/models/principal/sede.dart';
import 'package:igest_app/services/principal/sede_services.dart';
import 'package:igest_app/views/principal/widgets/custom_app_bar.dart';
import 'package:igest_app/views/principal/login_page.dart';

// ---------------------------------------------------------------------------
// WIDGET UbicanosPage
// ---------------------------------------------------------------------------
class UbicanosPage extends StatefulWidget {
  const UbicanosPage({super.key});
  @override
  State<UbicanosPage> createState() => _UbicanosPageState();
}

class _UbicanosPageState extends State<UbicanosPage> {
  // Variables, recursos y constantes
  bool _isLoading = true;
  String? _error;
  static const double _cardWidth = 270;
  static const double _cardPadding = 8;
  GoogleMapController? _mapController;
  final ScrollController _scroll = ScrollController();
  late BitmapDescriptor _iconDefault;
  late BitmapDescriptor _iconSelected;

  // Datos
  List<Sede> _sedes = [];
  int _selectedIdx = 0;

  @override
  void initState() {
    super.initState();
    _initializeData();
  }

  @override
  void dispose() {
    _scroll.dispose();
    _mapController?.dispose();
    super.dispose();
  }

  // Carga inicial de datos y recursos
  Future<void> _initializeData() async {
    final sedesData = SedeService.getDemoSedes();
    _sedes = sedesData;
    if (_sedes.isNotEmpty) {
      _iconDefault = await BitmapDescriptor.asset(ImageConfiguration.empty, 'assets/images/mapas/pin_${Vars.obMyUI.idEmpresa}.png');
      _iconSelected = await BitmapDescriptor.asset(ImageConfiguration.empty, 'assets/images/mapas/pin_${Vars.obMyUI.idEmpresa}_long.png');
    }
    if (mounted) setState(() => _isLoading = false);
  }

  // -------------------- MAP & UI ACTIONS -----------------------------------
  void _onMapCreated(GoogleMapController c) => _mapController = c;

  void _selectSede(int index) {
    if (index == _selectedIdx || index >= _sedes.length) return;
    setState(() => _selectedIdx = index);
    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_sedes[index].coords, 15));
    _scroll.animateTo(index * (_cardWidth + _cardPadding), duration: const Duration(milliseconds: 350), curve: Curves.easeInOut);
  }

  Future<void> _goToMyLocation() async {
    final hasPermission = await _ensureLocationPermission();
    if (!hasPermission || !mounted) return;

    try {
      final pos = await Geolocator.getCurrentPosition();
      _mapController?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(pos.latitude, pos.longitude), 16));
    } catch (e) {
      _snack('No se pudo obtener la ubicación actual.');
    }
  }

  // --- Gestión de permisos más robusta ---
  Future<bool> _ensureLocationPermission() async {
    if (!await Geolocator.isLocationServiceEnabled()) {
      _snack('Por favor, activa los servicios de ubicación.');
      return false;
    }

    var perm = await Geolocator.checkPermission();
    if (perm == LocationPermission.denied) {
      perm = await Geolocator.requestPermission();
    }

    if (perm == LocationPermission.denied) {
      _snack('El permiso de ubicación fue denegado.');
      return false;
    }

    if (perm == LocationPermission.deniedForever) {
      _snack('Permiso denegado permanentemente. Actívalo desde la configuración de la app.');
      return false;
    }
    return true;
  }

  void _snack(String msg) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  Set<Marker> get _markers => _sedes.asMap().entries.map((e) => Marker(markerId: MarkerId('${e.value.idSede}'), position: e.value.coords, icon: e.key == _selectedIdx ? _iconSelected : _iconDefault, onTap: () => _selectSede(e.key), zIndexInt: e.key == _selectedIdx ? 2 : 1)).toSet();

  // Contruir el widget principal
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Ubícanos', returnWidget: const LoginPage()),
      body: SafeArea(
        child: Builder(
          builder: (context) {
            if (_isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (_error != null) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(_error!, textAlign: TextAlign.center, style: const TextStyle(fontSize: 16)),
                ),
              );
            }
            return Stack(
              children: [
                _buildMap(),
                _buildMyLocationFab(),
                if (_sedes.isNotEmpty) Positioned(left: 0, right: 0, bottom: 10, child: _buildCards()),
              ],
            );
          },
        ),
      ),
    );
  }

  // Construir el mapa
  Widget _buildMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: _sedes.isNotEmpty ? CameraPosition(target: _sedes[_selectedIdx].coords, zoom: 12) : CameraPosition(target: const LatLng(-12.05, -77.05), zoom: 4),
      markers: _markers,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      gestureRecognizers: kIsWeb ? {Factory<OneSequenceGestureRecognizer>(() => EagerGestureRecognizer())} : const <Factory<OneSequenceGestureRecognizer>>{},
    );
  }

  // Construir botón flotante para ir a mi ubicación
  Widget _buildMyLocationFab() {
    return Positioned(
      bottom: 200,
      right: 16,
      child: FloatingActionButton(
        heroTag: 'myLocationBtn',
        backgroundColor: Colors.white,
        onPressed: _goToMyLocation,
        child: const Icon(Icons.my_location, color: Colors.blue),
      ),
    );
  }

  // Construir las tarjetas de las sedes
  Widget _buildCards() {
    return SizedBox(
      height: 180,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final totalWidth = (_sedes.length * _cardWidth) + math.max(0, _sedes.length - 1) * _cardPadding;
          final showArrows = kIsWeb && totalWidth > constraints.maxWidth - 80;
          final centerContent = totalWidth < constraints.maxWidth;
          final horizontalPadding = centerContent ? (constraints.maxWidth - totalWidth) / 2 : 40.0;
          return Stack(
            alignment: Alignment.center,
            children: [
              ListView.separated(
                controller: _scroll,
                scrollDirection: Axis.horizontal,
                physics: kIsWeb ? const NeverScrollableScrollPhysics() : null,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                itemCount: _sedes.length,
                separatorBuilder: (_, __) => const SizedBox(width: _cardPadding),
                itemBuilder: (context, index) => InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () => _selectSede(index),
                  child: SedeCardWidget(
                    sede: _sedes[index],
                    isSelected: index == _selectedIdx,
                    onPressed: () {
                      _selectSede(index);
                      _launchDirections(_sedes[index].coords);
                    },
                    cardWidth: _UbicanosPageState._cardWidth,
                  ),
                ),
              ),
              if (showArrows) ...[
                Positioned(
                  left: 2,
                  child: _ArrowBtn(icon: Icons.arrow_back_ios_new_rounded, onTap: _selectedIdx > 0 ? () => _selectSede(_selectedIdx - 1) : null),
                ),
                Positioned(
                  right: 2,
                  child: _ArrowBtn(icon: Icons.arrow_forward_ios_rounded, onTap: _selectedIdx < _sedes.length - 1 ? () => _selectSede(_selectedIdx + 1) : null),
                ),
              ],
            ],
          );
        },
      ),
    );
  }

  // Lanzar direcciones en la aplicación de mapas
  Future<void> _launchDirections(LatLng dest) async {
    final lat = dest.latitude;
    final lon = dest.longitude;

    final Uri url = switch (true) {
      _ when kIsWeb => Uri.parse('https://www.google.com/maps/dir/?api=1&destination=$lat,$lon'),
      _ when Platform.isIOS => Uri.parse('http://maps.apple.com/?daddr=$lat,$lon'),
      _ => Uri.parse('google.navigation:q=$lat,$lon'),
    };

    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      _snack('No se pudo abrir la aplicación de mapas');
    }
  }
} // end _UbicanosPageState

// ---------------------------------------------------------------------------
// WIDGET ArrowBtn
// ---------------------------------------------------------------------------
class _ArrowBtn extends StatelessWidget {
  const _ArrowBtn({required this.icon, this.onTap});
  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85),
        shape: BoxShape.circle,
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: IconButton(
        icon: Icon(icon, size: 20, color: onTap == null ? Colors.grey[400] : Colors.black87),
        tooltip: onTap != null ? (icon == Icons.arrow_back_ios_new_rounded ? 'Anterior' : 'Siguiente') : null,
        onPressed: onTap,
      ),
    );
  }
}
