import 'package:flutter/material.dart';

class ProfileCardImage extends StatelessWidget {
  String imagePath;

  ProfileCardImage(this.imagePath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        margin: EdgeInsets.only(
          left: 15.0,
          right: 15.0,
          bottom: 20.0,
        ),
        height: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(imagePath)),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            shape: BoxShape.rectangle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black38,
                  blurRadius: 15.0,
                  offset: Offset(0.0, 0.7))
            ]));
  }
}
