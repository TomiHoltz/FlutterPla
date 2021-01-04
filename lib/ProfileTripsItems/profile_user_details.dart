import 'package:flutter/material.dart';

class ProfileUserDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final profilePhoto = Container(
      margin: EdgeInsets.only(bottom: 5.0,left: 20.0),
      width: 80.0,
      height: 80.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/holtz.jpeg"))),
    );

    final profileName = Container(
      margin: EdgeInsets.only(left: 20.0, top: 20),

      child: Text(
        "Tomas Holtz",
        style: TextStyle(
          fontFamily: "Lato",
          color: Colors.white,
          fontSize: 20.0
        ),
      ),
    );

    final profileEmail = Container(
      margin: EdgeInsets.only(left: 20.0, top: 5),

      child: Text(
        "holtzTomy@gmail.com",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontFamily: "Lato",
          color: Colors.grey,
          fontSize: 15.0
        ),
      ),
    );

    final profileNameAndEmail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        profileName,
        profileEmail
      ],
    );

    return Container(
      margin: EdgeInsets.only(top: 110.0),
      height: 100,
      //decoration: BoxDecoration(color: Colors.black),
      child: Row(
      children: <Widget>[profilePhoto, profileNameAndEmail],
    ));
  }
}
