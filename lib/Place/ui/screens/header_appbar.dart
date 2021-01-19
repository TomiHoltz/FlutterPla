import 'package:flutter/material.dart';
import 'package:flutter_platzi/widgets/gradient_back.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack(gradientHeight: 250.0),
        CardImageList()
      ],

    );
  }
}
