import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_outkey/types/user.dart';

class UserService {
  Future<List<User>> listUsers(int role) async {
    final String response =
        await rootBundle.loadString('constants/users/users.json');
    final List<dynamic> data = await json.decode(response);

    List<User> listUsers = [];

    for (var element in data) {
      listUsers.add(User(
          name: element['name'],
          document: element['document'],
          latitude: element['latitude'],
          longitude: element['longitude'],
          password: element['password'],
          rolePermission: element['role_permission']));
    }

    if (role == -1) {
      return listUsers;
    }

    final filteredList =
        listUsers.where((element) => element.rolePermission == role).toList();

    return filteredList;
  }

  Future<User> findUser(String document) async {
    final users = await listUsers(-1);

    final user =
        users.where((element) => element.document == document).toList();

    if (user.isEmpty) throw 'Usuário não encontrado';

    return user[0];
  }
}
