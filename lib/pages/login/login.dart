import 'package:geolocator/geolocator.dart';
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
    documentController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    makeLogin() async {
      try {
        await _checkPermission();
        final position = await _currentLocation();
        final login = await Auth()
            .login(documentController.text, passwordController.text);

        if (!mounted) return;

        context.read<UserProvider>().updateUser(User(
            name: login.name,
            document: login.document,
            latitude: position.latitude.toString(),
            longitude: position.longitude.toString(),
            password: login.password,
            age: login.age,
            id: login.id,
            rolePermission: login.rolePermission));

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                  width: 200,
                  height: 150,
                  child: Image.asset('avatar-icon.jpg')),
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
            const SizedBox(
              height: 50,
            ),
            PrimaryButton(text: 'Login', onPress: makeLogin),
          ],
        ),
      ),
    );
  }
}

Future<bool> _checkPermission() async {
  LocationPermission permission;

  permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Necessário habilitar permissão de geolacalização!');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Permissão de localização negada, é necessário habilitar a permissão.');
  }
  return true;
}

Future<Position> _currentLocation() async {
  return await Geolocator.getCurrentPosition();
}
