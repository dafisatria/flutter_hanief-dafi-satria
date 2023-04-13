import 'package:demo_flutter_app/bloc/gallery/gallery_bloc.dart';
import 'package:demo_flutter_app/screens/tugas_advance_form/interactive_widget.dart';
import 'package:demo_flutter_app/screens/tugas_assets_bottomsheet_navigation/grid_image.dart';
import 'package:demo_flutter_app/screens/tugas_form/list_contact.dart';
import 'package:demo_flutter_app/screens/tugas_form/new_contact.dart';
import 'package:demo_flutter_app/providers/new_contact_providers.dart';
import 'package:demo_flutter_app/screens/tugas_rest_api/soal_eksplorasi/image_generator_form.dart';
import 'package:demo_flutter_app/screens/tugas_rest_api/soal_prioritas_1/contact_post_request_screen.dart';
import 'package:demo_flutter_app/screens/tugas_rest_api/soal_prioritas_1/contact_put_request_screen.dart';
import 'package:demo_flutter_app/screens/tugas_rest_api/soal_prioritas_2/image_generator.dart';
import 'package:demo_flutter_app/screens/tugas_storage/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xff6200EE),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (_) => const ContactPostScreen(),
        '/contact-put': (_) => const ContactPutScreen(),
        '/image-generator': (_) => const ImageGenerator(),
        '/image-generator-form': (_) => const ImageGeneratorForm(),
      },
    );
  }
}
