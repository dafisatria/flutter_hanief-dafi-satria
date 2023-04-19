import 'package:demo_flutter_app/view/screens/tugas_form/new_contact_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_form/new_contact_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('check ui new contact screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ContactProvider(),
        child: const MaterialApp(
          home: MyContact(),
        ),
      ),
    );
    expect(find.text('Create New Contacts'), findsOneWidget);
    expect(find.text('Pick Color'), findsOneWidget);
    expect(find.text('Pick File'), findsOneWidget);
    expect(find.text('Submit'), findsOneWidget);
    expect(find.byIcon(Icons.mobile_friendly_rounded), findsOneWidget);
  });
}
