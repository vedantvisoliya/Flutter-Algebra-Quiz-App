import 'package:flutter/material.dart';

class KeyboardButton extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final void Function()? onTap;
  final double? width;
  final double? height;
  const KeyboardButton({super.key, required this.text, required this.controller, this.onTap, this.width, this.height});

  @override
  State<KeyboardButton> createState() => _KeyboardButtonState();
}

class _KeyboardButtonState extends State<KeyboardButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {

    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(15.0),
      child: GestureDetector(
        onTap: widget.onTap ?? () {widget.controller.text += widget.text;},
        child: MouseRegion(
          onEnter: (event) {
            setState(() {
              isHovered = true;
            });
          },
          onExit: (event) {
            setState(() {
              isHovered = false;
            });
          },
          child: Container(
            height: widget.height ?? 45,
            width: widget.width ?? 45,
            decoration: BoxDecoration(
              color: isHovered? Theme.of(context).colorScheme.inverseSurface : Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
