import 'package:flutter/material.dart';

import '../../models/evento.dart';
import 'formulario.dart';

class ListaEventos extends StatefulWidget {
  const ListaEventos({super.key});

  @override
  State<ListaEventos> createState() => _ListaEventosState();
}

class _ListaEventosState extends State<ListaEventos> {
  final List<Evento> _eventos = [];

  Future<void> _abrirFormulario() async {
    final Evento? novoEvento = await Navigator.push<Evento>(
      context,
      MaterialPageRoute(
        builder: (context) => const FormularioEvento(),
      ),
    );

    if (novoEvento != null) {
      setState(() {
        _eventos.add(novoEvento);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eventos'),
      ),
      body: _eventos.isEmpty
          ? const Center(
              child: Text('Nenhum evento cadastrado'),
            )
          : ListView.builder(
              itemCount: _eventos.length,
              itemBuilder: (context, index) {
                final Evento evento = _eventos[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(evento.nome),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Local: ${evento.local}'),
                        Text('Data: ${evento.data}'),
                      ],
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        onPressed: _abrirFormulario,
        child: const Icon(Icons.add),
      ),
    );
  }
}
