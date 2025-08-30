import 'package:flutter/material.dart';
import 'package:igest_app/shared/utils/vars.dart';

class DropdownFormFieldWidget<T> extends StatelessWidget {
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final FormFieldValidator<T>? validator;
  final String label;
  final IconData? icon;

  const DropdownFormFieldWidget({super.key, required this.value, required this.items, required this.onChanged, this.validator, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    final ui = Vars.obMyUI;

    return DropdownButtonFormField<T>(
      isExpanded: true, // ← Añade esta línea
      value: value,
      items: items,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: ui.colorFondoST),
        prefixIcon: icon != null ? Icon(icon, color: ui.colorFondoST) : null,
        filled: true,
        fillColor: ui.colorFondoLT,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), // constante fija
          borderSide: BorderSide(color: ui.colorFondoDK),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ui.colorFondoST),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: ui.colorFondoDK, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      ),
      dropdownColor: Color.alphaBlend(ui.colorFondoLT.withAlpha(125), Colors.white), //(0[transparente]-255[puro/opcao] , fondo)
      iconEnabledColor: ui.colorFondoST,
      style: TextStyle(color: ui.colorFondoST),
    );
  }
}
