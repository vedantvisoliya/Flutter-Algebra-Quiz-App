import 'package:flutter/material.dart';
import 'package:math_quiz_game/widgets/keyboard_button.dart';

class Keyboard extends StatelessWidget {
  final TextEditingController controller;
  final void Function()? onSubmit;
  const Keyboard({super.key, required this.controller, this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            KeyboardButton(text: "DEL", controller: controller, onTap: () {controller.text = controller.text.substring(0, controller.text.length - 1);}),
            const SizedBox(width: 5),
            KeyboardButton(text: "AC", controller: controller, onTap: () {controller.clear();}),
            const SizedBox(width: 5),
            KeyboardButton(text: "x", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "/", controller: controller),
          ],
        ),

        const SizedBox(height: 5),

        Row(
          children: [
            KeyboardButton(text: "7", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "8", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "9", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "x", controller: controller),
          ],
        ),

        const SizedBox(height: 5),

        Row(
          children: [
            KeyboardButton(text: "4", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "5", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "6", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "-", controller: controller),
          ],
        ),

        const SizedBox(height: 5),

        Row(
          children: [
            KeyboardButton(text: "1", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "2", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "3", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "+", controller: controller),
          ],
        ),

        const SizedBox(height: 5),

        Row(
          children: [
            KeyboardButton(text: "0", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: ".", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: ",", controller: controller),
            const SizedBox(width: 5),
            KeyboardButton(text: "=", controller: controller),
          ],
        ),

        const SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            KeyboardButton(
              text: "Submit", 
              controller: controller, 
              width: 110, 
              height: 45,
              onTap: onSubmit,
            ),
          ],
        ),
      ],
    );
  }
}
