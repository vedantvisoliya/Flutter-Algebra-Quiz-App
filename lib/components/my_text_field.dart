import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final bool? obscureText;
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.maxLength,
    this.keyboardType,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText ?? false,
      keyboardType: keyboardType ?? TextInputType.text,
      maxLength: maxLength,
      controller: controller,
      decoration: InputDecoration(
        counterText: "", 
        hintText: hintText,
        filled: true,
        fillColor: Theme.of(context).colorScheme.tertiary,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
    );
  }
}
