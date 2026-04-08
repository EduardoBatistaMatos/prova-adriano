import 'package:flutter/material.dart';

import 'screens/eventos/lista.dart';

void main() {
  runApp(const AppEventos());
}

class AppEventos extends StatelessWidget {
  const AppEventos({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.teal,
      ),
      home: const ListaEventos(),
    );
  }
}
