import 'package:flutter/material.dart';
import 'package:flutter_outkey/types/user.dart';

class ItemList extends StatelessWidget {
  final User user;

  const ItemList({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Image.asset(
            'avatar-icon.jpg',
            fit: BoxFit.fill,
            scale: 8,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${user.name}'),
            Text('CPF: ${user.document}'),
            Text('Latitude: ${user.latitude}'),
            Text('Longitude: ${user.document}'),
          ],
        )
      ],
    );
  }
}
