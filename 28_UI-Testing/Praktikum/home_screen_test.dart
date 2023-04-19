import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_app/view/screens/home_screen.dart';

void main() {
  testWidgets(
    'check ui new contact screen',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: HomeScreen(),
        ),
      );
      expect(find.text('Welcome to Our App'), findsOneWidget);
      expect(find.text('Contact us'), findsOneWidget);
      expect(find.text('About Us'), findsOneWidget);
      expect(find.byType(Card), findsWidgets);
      expect(find.byType(TextField), findsWidgets);
      expect(find.byType(ElevatedButton), findsOneWidget);
    },
  );
}
