import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bank/main.dart';

void main() {
  testWidgets('Fluxo inicial da lista de eventos', (WidgetTester tester) async {
    await tester.pumpWidget(const AppEventos());

    expect(find.text('Eventos'), findsOneWidget);
    expect(find.text('Nenhum evento cadastrado'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(find.text('Novo Evento'), findsOneWidget);
  });
}
