import 'package:demo_flutter_app/tugas_advance_form/interactive_widget.dart';
import 'package:demo_flutter_app/tugas_form/new_contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff6200EE),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyContact(),
    );
  }
}
