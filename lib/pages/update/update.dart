import 'package:flutter/material.dart';
import 'package:flutter_outkey/components/buttons/primary/primary_button.dart';
import 'package:flutter_outkey/components/text_input/text_input.dart';
import 'package:flutter_outkey/provider/user_provider.dart';
import 'package:flutter_outkey/service/user_service.dart';
import 'package:flutter_outkey/types/user.dart';
import 'package:provider/provider.dart';

class Update extends StatefulWidget {
  const Update({Key? key}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  var user;

  final documentController = TextEditingController();
  final ageController = TextEditingController();
  final nameController = TextEditingController();

  @override
  void dispose() {
    documentController.dispose();
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  updateUser() async {
    try {
      if (nameController.text.length < 5) {
        throw 'O nome deve ter no mínimo 5 dígitos';
      }

      if (documentController.text.length != 11) {
        throw 'O CPF deve ter 11 dígitos';
      }

      if (int.parse(ageController.text) < 18) {
        throw 'Não pode ter menos de 18 (dezoito) anos';
      }

      final updateUser = User(
        name: nameController.text,
        document: documentController.text,
        age: int.parse(ageController.text),
        id: user.id,
        latitude: user.latitude,
        longitude: user.longitude,
        password: user.password,
        rolePermission: user.rolePermission,
      );

      UserService().updateUser(updateUser);

      if (!mounted) return;

      context.read<UserProvider>().updateUser(updateUser);
      setState(() {});
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

  @override
  Widget build(BuildContext context) {
    user = context.select((UserProvider user) => user).user;

    if (user != null) {
      documentController.text = user.document;
      nameController.text = user.name;
      ageController.text = '${user.age}';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Atualizar dados'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        // color: Colors.blue,
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'avatar-icon.jpg',
                  fit: BoxFit.fill,
                  scale: 4,
                ),
                Text("Nome: ${user.name ?? 'erro'}"),
                Text("CPF: ${user.document ?? 'erro'}"),
                Text("Idade: ${user.age ?? 'erro'}"),
                Text("Latitude: ${user.latitude ?? 'erro'}"),
                Text("Longitude: ${user.longitude ?? 'erro'}"),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: const [
                Text(
                  'Atualize os seus dados',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              children: [
                TextInput(
                  label: 'Nome',
                  value: '',
                  keyboardType: TextInputType.none,
                  controller: nameController,
                ),
                TextInput(
                  label: 'CPF',
                  value: '',
                  keyboardType: TextInputType.none,
                  controller: documentController,
                ),
                TextInput(
                  label: 'Idade',
                  value: '',
                  keyboardType: TextInputType.none,
                  controller: ageController,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            PrimaryButton(text: 'Salvar alterações', onPress: updateUser)
          ],
        ),
      ),
    );
  }
}
