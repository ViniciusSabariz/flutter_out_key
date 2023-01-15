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
            child: Text(text),
          ),
        ));
  }
}

            // FloatingActionButton(
            //   // When the user presses the button, show an alert dialog containing
            //   // the text that the user has entered into the text field.
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (context) {
            //         return AlertDialog(
            //           // Retrieve the text that the user has entered by using the
            //           // TextEditingController.
            //           content: Text(documentController.text),
            //         );
            //       },
            //     );
            //   },
            //   tooltip: 'Show me the value!',
            //   child: const Icon(Icons.text_fields),
            // ),