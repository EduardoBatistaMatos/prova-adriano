import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/transferencia.dart';

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  static const _tituloAppBar = 'Criando Transferencia';
  static const _rotuloCampoValor = 'Valor';
  static const _rotuloCampoNumeroConta = 'Numero da conta';
  static const _textoBotaoConfirmar = 'Confirmar';

  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  void dispose() {
    _controladorCampoNumeroConta.dispose();
    _controladorCampoValor.dispose();
    super.dispose();
  }

  void _criaTransferencia() {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta == null || valor == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha os campos com valores validos')),
      );
      return;
    }

    final Transferencia transferenciaCriada = Transferencia(valor, numeroConta);
    debugPrint('Criando Transferencia...');
    debugPrint('$transferenciaCriada');
    Navigator.pop(context, transferenciaCriada);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Editor(
                label: _rotuloCampoNumeroConta,
                controller: _controladorCampoNumeroConta,
              ),
              Editor(
                label: _rotuloCampoValor,
                controller: _controladorCampoValor,
              ),
              ElevatedButton(
                onPressed: _criaTransferencia,
                child: const Text(_textoBotaoConfirmar),
              ),
            ],
          ),
        ),
      ),
    );
  }
}