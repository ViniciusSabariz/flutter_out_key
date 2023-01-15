import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_outkey/types/user.dart';
import 'package:provider/provider.dart';

class UserProvider {
  User user;

  UserProvider({required this.user});

  void updateUser(User newUser) {
    user = newUser;
  }
}
