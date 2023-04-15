import 'package:flutter/material.dart';

class ImageSheet extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final parameter;
  const ImageSheet({Key? key, required this.parameter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halo!'),
        leading: IconButton(
          onPressed: () {
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Center(
        child: Image.asset('$parameter'),
      ),
    );
  }
}
