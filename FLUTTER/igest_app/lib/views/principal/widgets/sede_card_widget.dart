import 'package:flutter/material.dart';
import 'package:igest_app/models/principal/sede.dart';
import 'package:igest_app/shared/utils/vars.dart';

// ---------------------------------------------------------------------------
//  WIDGET SedeCardWidget
// ---------------------------------------------------------------------------
class SedeCardWidget extends StatelessWidget {
  const SedeCardWidget({super.key, required this.sede, this.isSelected = false, this.onPressed, this.cardWidth});
  final Sede sede;
  final bool isSelected;
  final VoidCallback? onPressed;
  final double? cardWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 12 : 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isSelected ? BorderSide(color: Vars.obMyUI.colorFondoST, width: 2) : BorderSide.none,
      ),
      child: Container(
        //width: _UbicanosPageState._cardWidth,
        width: cardWidth,
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Vars.obMyUI.colorFondoST, size: 22),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          sede.nomSede,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    sede.dirSede,
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 12),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: onPressed,
                    icon: const Icon(Icons.directions, size: 16),
                    label: const Text('Cómo llegar'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      minimumSize: const Size(0, 32),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            CircleAvatar(radius: 52, backgroundImage: NetworkImage(sede.nomImagen), backgroundColor: Colors.grey[200]),
          ],
        ),
      ),
    );
  }
}
