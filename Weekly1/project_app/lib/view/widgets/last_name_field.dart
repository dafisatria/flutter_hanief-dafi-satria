import 'package:flutter/material.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({
    super.key,
    required this.lastNameController,
  });

  final TextEditingController lastNameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: lastNameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'Last name',
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
