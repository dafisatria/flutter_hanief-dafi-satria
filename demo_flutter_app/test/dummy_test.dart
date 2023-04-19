import 'package:demo_flutter_app/view/screens/tugas_ui_test/dummy_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'check ui new contact screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: DummyScreen(),
        ),
      );
      expect(find.text('Ryujin cantik banget oma omaga'), findsOneWidget);
      expect(
          find.image(
            const AssetImage('assets/image4.jpg'),
          ),
          findsOneWidget);
    },
  );
}
