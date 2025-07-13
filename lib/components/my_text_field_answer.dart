import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextFieldAnswer extends StatelessWidget {
  final TextEditingController controller;
  const MyTextFieldAnswer({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: GoogleFonts.lora(
        fontSize: 18,
      ),
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      textAlign: TextAlign.center,
      autofocus: true,
      obscureText: false,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
