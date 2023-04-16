import 'package:flutter/material.dart';

class MessageField extends StatelessWidget {
  const MessageField({
    super.key,
    required this.messageController,
  });

  final TextEditingController messageController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: messageController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'What can we help you with?',
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
      maxLines: 3,
    );
  }
}
