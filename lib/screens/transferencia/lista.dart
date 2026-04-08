import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

class ListaTransferencias extends StatefulWidget {
  const ListaTransferencias({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaTranferenciaState();
  }
}

class ListaTranferenciaState extends State<ListaTransferencias> {
  static const _tituloAppBar = 'Transferencia';
  final List<Transferencia> _transferencias = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          _tituloAppBar,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromRGBO(33, 150, 243, 1),
      ),
      body: ListView.builder(
        itemCount: _transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = _transferencias[indice];
          return ItemTransferencia(transferencia: transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Botao + pressionado!');

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const FormularioTransferencia();
              },
            ),
          ).then((transferenciaRecebida) => _atualiza(transferenciaRecebida));
        },
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _atualiza(Transferencia? transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        _transferencias.add(transferenciaRecebida);
      });
    }
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia({
    super.key,
    required Transferencia transferencia,
  }) : _transferencia = transferencia;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
