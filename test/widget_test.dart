import 'package:flutter_test/flutter_test.dart';

import 'package:news_ffl/main.dart';

void main() {
  testWidgets('Carga navegación principal y botón de login', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const FflApp());

    expect(find.text('FFL'), findsOneWidget);
    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Juegos'), findsOneWidget);
  });
}
