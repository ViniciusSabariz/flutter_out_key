import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_outkey/components/item_list/item_list.dart';
import 'package:flutter_outkey/provider/user_provider.dart';
import 'package:flutter_outkey/types/user.dart';
import 'package:provider/provider.dart';

const teste = [1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5, 1, 2, 3, 4, 5];

class ListUser extends StatelessWidget {
  const ListUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = context.select((UserProvider user) => user).user;

    log(user.name.toString());
    log(context.select((UserProvider user) => user).user.name.toString());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            children: [
              Column(
                children: [
                  Image.asset(
                    'avatar-icon.jpg',
                    fit: BoxFit.fill,
                    scale: 4,
                  ),
                  Text(user.name ?? 'erro'),
                  const Text('CPF Vermelho'),
                  const Text('Lat: 12456334563'),
                  const Text('Lon: 89653456342'),
                ],
              ),
              Row(
                children: const [
                  Text(
                    'Usuários do sistema',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: teste.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = teste[index];
                    final user = User(
                        name: 'Joao+$item',
                        document: 'CPF-$item',
                        latitude: '',
                        longitude: '');

                    return ItemList(user: user);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
