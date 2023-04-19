import 'package:demo_flutter_app/model/food_models.dart';
import 'package:demo_flutter_app/view/screens/tugas_assets_bottomsheet_navigation/gallery_view_model/gallery_bloc.dart';
import 'package:demo_flutter_app/view/screens/tugas_advance_form/interactive_widget_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_assets_bottomsheet_navigation/grid_image_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_finite_state/list_food_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_finite_state/list_food_view_model.dart';
import 'package:demo_flutter_app/view/screens/tugas_form/list_contact_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_form/new_contact_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_form/new_contact_view_model.dart';
import 'package:demo_flutter_app/view/screens/tugas_rest_api/soal_eksplorasi/image_generator_form_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_rest_api/soal_prioritas_1/contact_post_request_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_rest_api/soal_prioritas_1/contact_post_request_view_model.dart';
import 'package:demo_flutter_app/view/screens/tugas_rest_api/soal_prioritas_1/contact_put_request_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_rest_api/soal_prioritas_2/image_generator_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_storage/login_screen.dart';
import 'package:demo_flutter_app/view/screens/tugas_ui_test/dummy_screen.dart';
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
        '/': (_) => const DummyScreen(),
        '/Contacts': (_) => const MyContact(),
      },
    );
  }
}
