import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_outkey/components/buttons/primary/primary_button.dart';
import 'package:flutter_outkey/components/text_input/text_input.dart';
import 'package:flutter_outkey/pages/list_user/list_user.dart';
import 'package:flutter_outkey/provider/user_provider.dart';
import 'package:flutter_outkey/service/auth.dart';
import 'package:flutter_outkey/types/user.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final documentController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    documentController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    makeLogin() async {
      try {
        final login = await Auth()
            .login(documentController.text, passwordController.text);

        if (!mounted) return;

        context.read<UserProvider>().updateUser(login);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const ListUser()));
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: SizedBox(
                    width: 200,
                    height: 150,
                    child: Image.asset('asset/images/flutter-logo.png')),
              ),
            ),
            TextInput(
              label: 'CPF',
              value: '',
              keyboardType: TextInputType.number,
              controller: documentController,
            ),
            TextInput(
              label: 'Senha',
              value: '',
              obscureText: true,
              keyboardType: TextInputType.number,
              controller: passwordController,
            ),
            PrimaryButton(text: 'Clica aqui', onPress: makeLogin),
          ],
        ),
      ),
    );
  }
}
