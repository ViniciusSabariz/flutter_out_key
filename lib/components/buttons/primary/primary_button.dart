import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPress;

  const PrimaryButton({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () => {onPress()},
        child: Container(
          width: MediaQuery.of(context).size.width * 0.80,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ));
  }
}
