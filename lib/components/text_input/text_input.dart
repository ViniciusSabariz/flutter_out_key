import 'package:flutter/material.dart';

class TextInput extends StatefulWidget {
  TextInput({
    super.key,
    required this.label,
    required this.value,
    required this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  final String label;
  final String value;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextEditingController controller;

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.obscureText,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}
