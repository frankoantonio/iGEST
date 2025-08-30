// import 'package:flutter/material.dart';
// import 'package:igest_app/shared/views/login_page.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({super.key});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int _selectedIndex = 0;
//   bool _isDesktopSidebarOpen = true;
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   static const List<String> _menuOptions = [
//     'Dashboard',
//     'Usuarios',
//     'Clientes',
//     'Productos',
//     'Reportes',
//     'Configuración',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final bool isLargeScreen = MediaQuery.of(context).size.width > 768;
//
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         title: Row(
//           children: [
//             if (isLargeScreen)
//               Padding(
//                 padding: const EdgeInsets.only(right: 16.0),
//                 child: Image.network(
//                   'https://igest.pe/resources/SJBCORP/logo_1004.png',
//                   height: 40,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             const Expanded(
//               child: Text(
//                 'Sistema iGest',
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//             ),
//             if (isLargeScreen)
//               IconButton(
//                 icon: Icon(
//                   _isDesktopSidebarOpen ? Icons.chevron_left : Icons.chevron_right,
//                 ),
//                 onPressed: () => setState(
//                   () => _isDesktopSidebarOpen = !_isDesktopSidebarOpen,
//                 ),
//               ),
//             const NotificationIcon(),
//             const MessageIcon(),
//             const UserMenu(),
//           ],
//         ),
//         leading: isLargeScreen
//             ? null
//             : IconButton(
//                 icon: const Icon(Icons.menu),
//                 onPressed: () => _scaffoldKey.currentState?.openDrawer(),
//               ),
//       ),
//       drawer: isLargeScreen ? null : _buildMobileDrawer(),
//       body: Row(
//         children: [
//           if (isLargeScreen) _buildDesktopSidebar(),
//           Expanded(child: _buildContent()),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildDesktopSidebar() {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 300),
//       width: _isDesktopSidebarOpen ? 280 : 0,
//       child: _isDesktopSidebarOpen ? _buildSidebarContent() : null,
//     );
//   }
//
//   Widget _buildMobileDrawer() {
//     return Drawer(child: _buildSidebarContent());
//   }
//
//   Widget _buildSidebarContent() {
//     return Container(
//       color: Colors.blueGrey[50],
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(20),
//             color: Colors.blue[800],
//             child: const Center(
//               child: Text(
//                 'iGest Sistema',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: _menuOptions.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Icon(_getMenuIcon(_menuOptions[index])),
//                   title: Text(_menuOptions[index]),
//                   selected: _selectedIndex == index,
//                   onTap: () {
//                     setState(() => _selectedIndex = index);
//                     if (MediaQuery.of(context).size.width <= 768) {
//                       Navigator.pop(context);
//                     }
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 _buildModuleButton('Logística', Icons.local_shipping),
//                 _buildModuleButton('Comercial', Icons.shopping_cart),
//                 _buildModuleButton('Finanzas', Icons.attach_money),
//                 _buildModuleButton('Académico', Icons.school),
//                 _buildModuleButton('Médico', Icons.medical_services),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildModuleButton(String text, IconData icon) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: ElevatedButton.icon(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.blue[800],
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20),
//             side: BorderSide(color: Colors.blue[800]!),
//           ),
//           padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         ),
//         onPressed: () {},
//         icon: Icon(icon),
//         label: Text(text),
//       ),
//     );
//   }
//
//   Widget _buildContent() {
//     return Container(
//       padding: const EdgeInsets.all(20),
//       child: Center(
//         child: Text(
//           'Contenido: ${_menuOptions[_selectedIndex]}',
//           style: const TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
//
//   IconData _getMenuIcon(String option) {
//     switch (option) {
//       case 'Dashboard':
//         return Icons.dashboard;
//       case 'Usuarios':
//         return Icons.people;
//       case 'Clientes':
//         return Icons.business;
//       case 'Productos':
//         return Icons.inventory;
//       case 'Reportes':
//         return Icons.assessment;
//       case 'Configuración':
//         return Icons.settings;
//       default:
//         return Icons.list;
//     }
//   }
// }
//
// class NotificationIcon extends StatelessWidget {
//   const NotificationIcon({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Badge(
//         label: const Text('3'),
//         child: const Icon(Icons.notifications),
//       ),
//       onPressed: () => _showNotifications(context),
//     );
//   }
//
//   static void _showNotifications(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Notificaciones'),
//         content: const Text('No hay notificaciones nuevas'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MessageIcon extends StatelessWidget {
//   const MessageIcon({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       icon: Badge(label: const Text('5'), child: const Icon(Icons.mail)),
//       onPressed: () => _showMessages(context),
//     );
//   }
//
//   static void _showMessages(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Mensajes'),
//         content: const Text('No hay mensajes nuevos'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('OK'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class UserMenu extends StatelessWidget {
//   const UserMenu({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       icon: const CircleAvatar(
//         backgroundImage: NetworkImage(
//           'https://igest.pe/resources/SJBCORP/logo_1004.png',
//         ),
//         radius: 16,
//       ),
//       onSelected: (value) => _handleUserMenuSelection(context, value),
//       itemBuilder: (context) => [
//         const PopupMenuItem(value: 'profile', child: Text('Mi perfil')),
//         const PopupMenuItem(value: 'settings', child: Text('Configuración')),
//         const PopupMenuItem(value: 'logout', child: Text('Cerrar sesión')),
//       ],
//     );
//   }
//
//   void _handleUserMenuSelection(BuildContext context, String value) {
//     switch (value) {
//       case 'logout':
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginPage()),
//         );
//         break;
//       case 'profile':
//         // Navegar a perfil
//         break;
//       case 'settings':
//         // Navegar a configuración
//         break;
//     }
//   }
// }
