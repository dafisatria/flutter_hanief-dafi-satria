import 'package:flutter/material.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    super.key,
    required this.firstNameController,
  });

  final TextEditingController firstNameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: firstNameController,
      decoration: InputDecoration(
        labelText: 'First name *',
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[300],
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      cursorColor: Colors.black,
    );
  }
}
