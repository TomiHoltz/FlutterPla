import 'package:flutter/material.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_card_image_and_details.dart';

class ProfileCardsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 275),
      child: ListView(
        children: <Widget>[
          ProfileCardImageAndDetails("Miami", "Miami is the last occident's bastion", 123, "assets/images/beach.jpeg"),
          ProfileCardImageAndDetails("Everest", "Everest is the highest mountain in the world", 20000, "assets/images/river.jpeg"),
          ProfileCardImageAndDetails("Switerland", "The most beatifoul country in Europe", 14000, "assets/images/sunset.jpeg"),
        ],
      ),
    );
  }
}
