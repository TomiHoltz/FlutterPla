import 'package:flutter/material.dart';
import 'package:flutter_platzi/User/model/user.dart';

class Place {
  String id;
  String name;
  String description;
  String urlImage;
  int likes;
  Userr userOwner;

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.urlImage,
    @required this.userOwner,
    this.likes
  });
}
