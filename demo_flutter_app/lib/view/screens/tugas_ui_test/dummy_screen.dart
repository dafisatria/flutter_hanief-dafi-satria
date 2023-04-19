import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/image4.jpg'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Ryujin cantik banget oma omaga',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
