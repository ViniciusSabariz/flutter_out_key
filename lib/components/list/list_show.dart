import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_outkey/components/item_list/item_list.dart';
import 'package:flutter_outkey/service/user_service.dart';
import 'package:flutter_outkey/types/user.dart';

class ListShow extends StatefulWidget {
  final int rolePermission;

  const ListShow({super.key, required this.rolePermission});

  @override
  State<ListShow> createState() => _ListShowState();
}

class _ListShowState extends State<ListShow> {
  List<User> _listUsers = [];

  void _changeList(List<User> newList) {
    setState(() {
      _listUsers = newList;
    });
  }

  getListUser() async {
    try {
      final listUserByRole =
          await UserService().listUsers(widget.rolePermission);

      _changeList(listUserByRole);
      if (kDebugMode) {
        print(listUserByRole[0]);
      }
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
  void initState() {
    super.initState();
    getListUser();
  }

  @override
  Widget build(BuildContext context) {
    if (_listUsers.isEmpty) {
      return const Text('Nada para mostrar awui!');
    }

    return ListView.builder(
      itemCount: _listUsers.length,
      itemBuilder: (BuildContext context, int index) {
        final item = _listUsers[index];
        final user = User(
          name: item.name,
          document: item.document,
          latitude: 'Latitude: ${item.latitude}',
          longitude: 'longitude: ${item.longitude}',
        );

        return ItemList(user: user);
      },
    );
  }
}
