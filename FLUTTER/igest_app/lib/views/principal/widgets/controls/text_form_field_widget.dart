import 'package:flutter/material.dart';
import 'package:igest_app/shared/utils/vars.dart';

class TextFormFieldWidget extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final bool isPwd;
  final TextInputType keyboardType;
  final int? maxLength;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final bool enabled;
  final String? hintText;
  ///////////final Color? labelTextColor; // <-- AÑADE ESTA LÍNEA
  final EdgeInsetsGeometry contentPadding;

  const TextFormFieldWidget({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    this.isPwd = false,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.validator,
    this.onFieldSubmitted,
    this.onChanged,
    this.enabled = true,
    this.hintText,
   //////////////////// this.labelTextColor, // <-- AÑADE ESTA LÍNEA
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  });

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPwd;
  }

  @override
  Widget build(BuildContext context) {
    final labelColor = Vars.obMyUI.colorFondoDK;
    final enabledBorderColor = labelColor.withAlpha(80);
    final focusedBorderColor = labelColor;

    // <-- AÑADE ESTA LÍNEA
    ////////////////////final Color effectiveLabelTextColor = widget.labelTextColor ?? labelColor.withAlpha(180);

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPwd ? _obscureText : false,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      enabled: widget.enabled,
      style: TextStyle(color: widget.enabled ? labelColor : Colors.grey, fontSize: 16),
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        //labelStyle: TextStyle(color: labelColor.withAlpha(180), fontSize: 16),
        labelStyle: TextStyle(color: Vars.obMyUI.colorLabSec, fontSize: 16),
        hintStyle: TextStyle(color: labelColor.withAlpha(120), fontSize: 14),
        prefixIcon: widget.icon != null ? Icon(widget.icon, color: labelColor, size: 22) : null,
        suffixIcon: widget.isPwd
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off, color: labelColor, size: 22),
                onPressed: () => setState(() => _obscureText = !_obscureText),
                tooltip: _obscureText ? 'Mostrar contraseña' : 'Ocultar contraseña',
              )
            : null,
        counterText: '',
        contentPadding: widget.contentPadding,
        filled: true,
        fillColor: widget.enabled ? Colors.transparent : Colors.grey.withAlpha(20),
        border: _outlineBorder(enabledBorderColor),
        enabledBorder: _outlineBorder(enabledBorderColor),
        focusedBorder: _outlineBorder(focusedBorderColor, width: 2),
        errorBorder: _outlineBorder(Colors.red),
        focusedErrorBorder: _outlineBorder(Colors.red, width: 2),
        disabledBorder: _outlineBorder(Colors.grey.withAlpha(80)),
      ),
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onChanged: widget.onChanged,
    );
  }

  OutlineInputBorder _outlineBorder(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}
