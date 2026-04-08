import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/evento.dart';

class FormularioEvento extends StatefulWidget {
  const FormularioEvento({super.key});

  @override
  State<FormularioEvento> createState() => _FormularioEventoState();
}

class _FormularioEventoState extends State<FormularioEvento> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _localController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();

  void _salvar() {
    final String nome = _nomeController.text.trim();
    final String local = _localController.text.trim();
    final String data = _dataController.text.trim();

    if (nome.isEmpty || local.isEmpty || data.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha todos os campos')),
      );
      return;
    }

    final Evento novoEvento = Evento(nome: nome, local: local, data: data);
    Navigator.pop(context, novoEvento);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _localController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Editor(label: 'Nome', controller: _nomeController),
            Editor(label: 'Local', controller: _localController),
            Editor(label: 'Data', controller: _dataController),
            const SizedBox(height: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
              ),
              onPressed: _salvar,
              child: const Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
