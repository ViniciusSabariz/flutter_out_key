import 'package:flutter/material.dart';
import 'package:flutter_outkey/components/buttons/primary/primary_button.dart';
import 'package:flutter_outkey/components/list/list_show.dart';
import 'package:flutter_outkey/pages/update/update.dart';
import 'package:flutter_outkey/provider/user_provider.dart';
import 'package:provider/provider.dart';

const teste = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5];

class ListUser extends StatefulWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  var user;

  editUser() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Update()));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    user = context.select((UserProvider user) => user).user;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    'avatar-icon.jpg',
                    fit: BoxFit.fill,
                    scale: 4,
                  ),
                  const SizedBox(
                    height: 10,
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
                    'Usuários do sistema',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListShow(
                rolePermission: user.rolePermission ?? 0,
              )),
              user.rolePermission == 1
                  ? PrimaryButton(text: 'Alterar Dados', onPress: editUser)
                  : const SizedBox(
                      height: 0,
                    ),
            ],
          ),
        ));
  }
}
