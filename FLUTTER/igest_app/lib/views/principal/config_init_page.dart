import 'package:flutter/material.dart';
import 'package:igest_app/shared/utils/vars.dart';
import 'package:provider/provider.dart';
import 'package:igest_app/models/principal/empresa.dart';
import 'package:igest_app/views/principal/widgets/controls/text_form_field_widget.dart';
import 'package:igest_app/views/principal/widgets/controls/dropdown_form_field_widget.dart';
import 'package:igest_app/views/principal/widgets/controls/button_widget.dart';
import 'package:igest_app/providers/principal/config_init_provider.dart';

class ConfigInitPage extends StatelessWidget {
  const ConfigInitPage({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) => ConfigInitProvider(), child: const _ConfigInitView());
  }
}

class _ConfigInitView extends StatefulWidget {
  const _ConfigInitView();
  @override
  State<_ConfigInitView> createState() => _ConfigInitViewState();
}

class _ConfigInitViewState extends State<_ConfigInitView> {
  final _formKey = GlobalKey<FormState>();
  final _rucController = TextEditingController();

  @override
  void dispose() {
    _rucController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vars.obMyUI.colorFondoDK,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400, minWidth: 320),
            child: Card(
              color: Vars.obMyUI.colorFondoLT,
              elevation: 8,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(padding: const EdgeInsets.all(30), child: _buildForm()),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLogo(),
          const SizedBox(height: 30),
          _buildRucField(),
          _buildErrorMessage(),
          _buildEmpresaDropdown(),
          const SizedBox(height: 30),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset('assets/images/logos/logo_1000.png', width: 200, height: 150);
  }

  Widget _buildRucField() {
    return Consumer<ConfigInitProvider>(
      builder: (context, provider, _) {
        return Row(
          children: [
            Expanded(
              child: TextFormFieldWidget(
                controller: _rucController,
                label: 'Ingrese RUC',
                icon: Icons.business,
                keyboardType: TextInputType.number,
                maxLength: 11,
                validator: provider.validateRuc,
                onFieldSubmitted: (_) => _verificarRuc(),
                enabled: provider.isRucFieldEnabled,
                onChanged: (value) => provider.setRucText(value),
              ),
            ),
            const SizedBox(width: 10),
            _buildVerifyButton(),
          ],
        );
      },
    );
  }

  Widget _buildVerifyButton() {
    return Consumer<ConfigInitProvider>(
      builder: (context, provider, _) {
        return SizedBox(
          width: 48,
          height: 48,
          child: provider.isLoading
              ? const Padding(
                  padding: EdgeInsets.all(12),
                  child: CircularProgressIndicator(strokeWidth: 2, color: Colors.green),
                )
              : ButtonWidget(
                  text: '',
                  icon: !provider.isRucFieldEnabled ? Icons.edit : Icons.check,
                  type: ButtonType.text,
                  width: 140,
                  onPressed: !provider.isRucFieldEnabled ? _enableRucField : _verificarRuc,
                ),
        );
      },
    );
  }

  Widget _buildErrorMessage() {
    return Selector<ConfigInitProvider, String?>(
      selector: (_, provider) => provider.errorMessage,
      builder: (context, errorMessage, _) {
        if (errorMessage == null) return const SizedBox.shrink();

        return Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.red.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.red.shade200),
          ),
          child: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.red.shade600, size: 20),
              const SizedBox(width: 8),
              Expanded(
                child: Text(errorMessage, style: TextStyle(color: Colors.red.shade700)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmpresaDropdown() {
    return Selector<ConfigInitProvider, List<Empresa>>(
      selector: (_, provider) => provider.empresas,
      builder: (context, empresas, _) {
        if (empresas.isEmpty) return const SizedBox.shrink();

        return Column(
          children: [
            const SizedBox(height: 20),
            Consumer<ConfigInitProvider>(
              builder: (context, provider, _) {
                return DropdownFormFieldWidget<Empresa>(
                  label: 'Empresas relacionadas',
                  value: provider.selectedEmpresa,
                  icon: Icons.business,
                  items: empresas
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.nomComercial, overflow: TextOverflow.ellipsis),
                        ),
                      )
                      .toList(),
                  onChanged: provider.setSelectedEmpresa,
                  validator: empresas.length > 1 ? (v) => v == null ? 'Seleccione una empresa' : null : null,
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildContinueButton() {
    return Consumer<ConfigInitProvider>(
      builder: (context, provider, _) {
        return SizedBox(
          width: double.infinity,
          height: 48,
          child: ButtonWidget(
            text: 'Continuar',
            icon: Icons.arrow_forward,
            type: ButtonType.filled,
            width: 140,
            onPressed: provider.canContinue ? _continuar : null,
          ),
        );
      },
    );
  }

  Future<void> _verificarRuc() async {
    if (!_formKey.currentState!.validate()) return;

    final provider = context.read<ConfigInitProvider>();
    await provider.verificarRuc();
  }

  void _enableRucField() {
    final provider = context.read<ConfigInitProvider>();
    provider.enableRucField();
  }

  void _continuar() {
    final provider = context.read<ConfigInitProvider>();
    final empresa = provider.continuar();

    if (empresa == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Seleccione una empresa válida')));
      return;
    }

    // Navigator.pushNamed(context, '/dashboard', arguments: empresa);
  }
}
