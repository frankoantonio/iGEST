import 'package:flutter/material.dart';
import 'package:igest_app/shared/utils/vars.dart';

// Tipos de botones disponibles
enum ButtonType { filled, elevated, outlined, text }

// ---------------------------------------------------------------------------
// ButtonWidget
// ---------------------------------------------------------------------------
class ButtonWidget extends StatelessWidget {
  // Variable y constantes
  final double? width;
  final double height;
  final String text;
  final IconData? icon;
  final ButtonType type;
  final VoidCallback? onPressed;
  final bool loading;
  final String? loadingText;
  final double iconSpacing; // espacio entre el icono y el texto
  final EdgeInsetsGeometry padding; // padding interno del botón

  const ButtonWidget({super.key, required this.text, this.icon, this.onPressed, this.type = ButtonType.filled, this.loading = false, this.loadingText, this.width, this.height = 45, this.iconSpacing = 7.0, this.padding = const EdgeInsets.symmetric(horizontal: 10.0)});

  @override
  Widget build(BuildContext context) {
    final Size fixedSize = width != null ? Size(width!, height) : Size.fromHeight(height);

    final ButtonStyle style = switch (type) {
      ButtonType.elevated => ElevatedButton.styleFrom(
        backgroundColor: Vars.obMyUI.colorFondoDK,
        foregroundColor: Vars.obMyUI.colorLabelPri,
        fixedSize: fixedSize,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      ButtonType.filled => FilledButton.styleFrom(
        backgroundColor: Vars.obMyUI.colorFondoST,
        foregroundColor: Vars.obMyUI.colorLabelPri,
        fixedSize: fixedSize,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      ButtonType.outlined => OutlinedButton.styleFrom(
        foregroundColor: Vars.obMyUI.colorFondoDK,
        side: BorderSide(color: Vars.obMyUI.colorFondoDK),
        fixedSize: fixedSize,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      ButtonType.text => TextButton.styleFrom(
        foregroundColor: Vars.obMyUI.colorFondoDK,
        fixedSize: fixedSize,
        padding: padding,
        textStyle: const TextStyle(fontWeight: FontWeight.w600),
      ),
    };

    // Contenido del botón
    final Widget content = loading
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Vars.obMyUI.colorLabelPri)),
              const SizedBox(width: 10),
              Flexible(child: Text(loadingText ?? 'Cargando...', overflow: TextOverflow.ellipsis, softWrap: false)),
            ],
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, size: 20),
              if (icon != null) SizedBox(width: iconSpacing),
              Flexible(child: Text(text, overflow: TextOverflow.ellipsis, softWrap: false)),
            ],
          );

    // Deshabilitar cuando loading O onPressed == null
    final bool disabled = loading || onPressed == null;

    // Devolver botón construido
    return switch (type) {
      ButtonType.filled => FilledButton(onPressed: disabled ? null : onPressed, style: style, child: content),
      ButtonType.elevated => ElevatedButton(onPressed: disabled ? null : onPressed, style: style, child: content),
      ButtonType.outlined => OutlinedButton(onPressed: disabled ? null : onPressed, style: style, child: content),
      ButtonType.text => TextButton(onPressed: disabled ? null : onPressed, style: style, child: content),
    };
  }
}
