import 'package:flutter_test/flutter_test.dart';

import 'package:news_ffl/main.dart';

void main() {
  testWidgets('Navega a HomeScreen al presionar EMPEZAR', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('EMPEZAR'), findsOneWidget);
    expect(find.text('Posiciones'), findsNothing);

    await tester.tap(find.text('EMPEZAR'));
    await tester.pumpAndSettle();

    expect(find.text('Posiciones'), findsOneWidget);
  });
}
