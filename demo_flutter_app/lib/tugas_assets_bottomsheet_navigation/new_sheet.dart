import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ImageSheet extends StatelessWidget {
  final parameter;
  const ImageSheet({Key? key, required this.parameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halo!'),
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/Image');
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Image.asset('$parameter'),
      ),
    );
  }
}
