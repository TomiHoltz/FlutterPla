import 'package:flutter/material.dart';
import 'package:flutter_platzi/Bottons/floating_acton_button_green.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_card_details.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_card_image.dart';

class ProfileCardImageAndDetails extends StatelessWidget {
  String placeTitle;
  String placeDescription;
  int placeSteps;
  String imagePath;

  ProfileCardImageAndDetails(
      this.placeTitle, this.placeDescription, this.placeSteps, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Stack(
        alignment: Alignment(0.6, 1.2),
        children: <Widget>[
          ProfileCardImage(imagePath),
          ProfileCardDetails(placeTitle, placeDescription, placeSteps),
          FloatinActionButtonGreen()
        ],
      ),
    );
  }
}
