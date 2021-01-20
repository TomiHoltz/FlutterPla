import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_platzi/widgets/gradient_back.dart';
import 'package:flutter_platzi/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;
  String screenTitle = "Add a new Place";

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          GradientBack(gradientHeight: 300),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                padding: EdgeInsets.only(top: 45.0, left: 15.0, right: 10.0),
                child: TitleHeader(
                  title: widget.screenTitle,
                ),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
