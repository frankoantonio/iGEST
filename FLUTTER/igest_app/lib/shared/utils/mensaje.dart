// import 'package:flutter/material.dart';
// import 'package:igest_app/core/vars.dart';
//
// enum Estado { success, warning, error, yesNo, yesNoCancel, cancel }
//
// class Msg {
//   static void msg(BuildContext context, String msg, Estado estado) {
//     String titulo = "iGEST";
//
//     if (Vars.nombreUsuario != null && estado != Estado.error) {
//       List<String> noms = Vars.nombreUsuario!.split(' ');
//       msg = "${noms[0]}.  $msg";
//     }
//
//     String x = Vars.rucEmpresa;
//
//     print(x);
//
//     Icon icon;
//     switch (estado) {
//       case Estado.success:
//         icon = const Icon(Icons.check_circle, color: Colors.green);
//         break;
//       case Estado.warning:
//         icon = const Icon(Icons.warning, color: Colors.orange);
//         break;
//       case Estado.error:
//         icon = const Icon(Icons.error, color: Colors.red);
//         break;
//       default:
//         icon = const Icon(Icons.info, color: Colors.blue);
//         break;
//     }
//
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(titulo),
//         content: Row(
//           children: [
//             icon,
//             const SizedBox(width: 10),
//             Expanded(child: Text(msg)),
//           ],
//         ),
//         actions: [TextButton(child: const Text("OK"), onPressed: () => Navigator.of(context).pop())],
//       ),
//     );
//   }
//
//   static Future<Estado?> msgQ(BuildContext context, String msg, Estado estado) async {
//     String titulo = "iGEST";
//
//     if (Vars.nombreUsuario != null && estado != Estado.error) {
//       List<String> noms = Vars.nombreUsuario!.split(' ');
//       msg = "${noms[0]}.  $msg";
//     }
//
//     List<Widget> acciones = [];
//
//     switch (estado) {
//       case Estado.yesNo:
//         acciones = [TextButton(child: const Text("No"), onPressed: () => Navigator.of(context).pop(Estado.warning)), TextButton(child: const Text("Sí"), onPressed: () => Navigator.of(context).pop(Estado.success))];
//         break;
//
//       case Estado.yesNoCancel:
//         acciones = [
//           TextButton(child: const Text("Cancelar"), onPressed: () => Navigator.of(context).pop(Estado.cancel)),
//           TextButton(child: const Text("No"), onPressed: () => Navigator.of(context).pop(Estado.warning)),
//           TextButton(child: const Text("Sí"), onPressed: () => Navigator.of(context).pop(Estado.success)),
//         ];
//         break;
//
//       default:
//         acciones = [TextButton(child: const Text("OK"), onPressed: () => Navigator.of(context).pop())];
//         break;
//     }
//
//     return showDialog<Estado>(
//       context: context,
//       builder: (_) => AlertDialog(title: Text(titulo), content: Text(msg), actions: acciones),
//     );
//   }
// }
