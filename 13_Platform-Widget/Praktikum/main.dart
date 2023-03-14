import 'package:demo_flutter_app/soal_prioritas_1/material_listview_app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_flutter_app/exploration_app.dart';
import 'package:demo_flutter_app/soal_prioritas_1/material_app.dart';
import 'package:demo_flutter_app/soal_prioritas_2/cupertino_app.dart';

void main() {
  runApp(const MyApp());
}

// soal prioritas 1
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData.dark(),
//       home:
//           // nomor 1
//           // const HomePage(),
//           // nomor 2
//           const ListPage(),
//     );
//   }
// }

// soal prioritas 2
// class MyApp extends StatelessWidget {
//   final _themeDark = const CupertinoThemeData.raw(
//     Brightness.dark,
//     null,
//     null,
//     null,
//     null,
//     null,
//   );
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoApp(
//       theme: _themeDark,
//       home: const HomePageCupertino(),
//     );
//   }
// }

// soal eksplorasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xff6200EE),
          secondary: const Color(0xff03DAC5),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const ExplorationPage(),
    );
  }
}
