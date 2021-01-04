import 'package:flutter/material.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_card_image_and_details.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_cards_list.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_header_appbar.dart';

class ProfileTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        //ProfilePostsList()
        ProfileHeaderAppBar(),
        ProfileCardsList()
      ],
    );
  }

}