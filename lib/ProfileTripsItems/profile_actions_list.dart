import 'package:flutter/material.dart';
import 'package:flutter_platzi/Bottons/floating_action_button_white.dart';
import 'package:flutter_platzi/Bottons/floating_action_button_white_mini.dart';

class ProfileActionsList extends StatelessWidget {
  double containerHeight = 100;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 190, left: 15, right: 15),
      height: containerHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          FloatingActionButtonWhiteMini(Icons.save_alt, "Save"),
          FloatingActionButtonWhiteMini(Icons.card_giftcard, "Buy"),
          FloatingActionButtonWhite(Icons.add, "Agregar"),
          FloatingActionButtonWhiteMini(Icons.mail, "Email"),
          FloatingActionButtonWhiteMini(Icons.person, "Profile"),
        ],
      ),
    );
  }
}
