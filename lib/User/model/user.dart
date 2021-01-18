import 'package:flutter/material.dart';
import 'package:flutter_platzi/Place/model/place.dart';

class Userr {
  final String uid;
  final String name;
  final String email;
  final String photoUrl;
  final List<Place> myPlaces;
  final List<Place> myFavouritePlaces;

  //myFavoritePlaces
  //myPlaces

  Userr({
    Key key,
    @required this.uid,
    @required this.name,
    @required this.email,
    @required this.photoUrl,
    this.myPlaces,
    this.myFavouritePlaces
  });
}
