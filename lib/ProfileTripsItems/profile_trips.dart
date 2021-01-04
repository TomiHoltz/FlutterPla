import 'package:flutter/material.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_background.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_header.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_places_list.dart';


class ProfileTrips extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    );
  }

}