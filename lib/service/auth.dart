import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_outkey/service/user_service.dart';
import 'package:flutter_outkey/types/user.dart';

class Auth {
  Future<User> login(String document, String password) async {
    final user = await UserService().findUser(document);

    if (user.password != password) {
      throw 'CPF ou Senha incorretos';
    }

    return user;
  }
}
