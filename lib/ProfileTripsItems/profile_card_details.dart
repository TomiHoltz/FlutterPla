import 'package:flutter/material.dart';
import 'package:flutter_platzi/Bottons/floating_acton_button_green.dart';

class ProfileCardDetails extends StatelessWidget {
  String title;
  String details;
  int steps;

  ProfileCardDetails(this.title, this.details, this.steps);

  @override
  Widget build(BuildContext context) {
    
    final placeTitle = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(
        top: 10.0,
        left: 30.0,
        right: 30.0
      ),

      child: Text(
        title,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 25.0,
          fontWeight: FontWeight.w900
        ),
        textAlign: TextAlign.left,
      ),
    );

    final placeDetails = Container(
      alignment: Alignment.centerLeft,
       margin: EdgeInsets.only(
        left: 30.0,
        right: 40.0
      ),

      child: Text(
        details,
        style: TextStyle(
          fontFamily: "Lato",
          fontSize: 13.0,
          color: Colors.grey
        ),
        textAlign: TextAlign.left,
      ),
    );

    final placeSteps = Container(
      alignment: Alignment.bottomLeft,
       margin: EdgeInsets.only(
        bottom: 10,
        left: 30.0,
        right: 30.0
      ),

      child: Text(
        "Steps: $steps",
        style: TextStyle(
          color: Colors.orange,
          fontFamily: "Lato",
          fontSize: 20.0,
          fontWeight: FontWeight.w500
        ),
        textAlign: TextAlign.left,
      ),
    );

    final placeDescriptionColumn = Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        placeTitle,
        placeDetails,
        placeSteps,
      ],
    );


    return Container(
      margin: EdgeInsets.only(left: 30, right: 30),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: placeDescriptionColumn,
    );
  }
}
