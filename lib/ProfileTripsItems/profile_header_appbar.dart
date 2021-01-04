import 'package:flutter/material.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_actions_list.dart';
import 'package:flutter_platzi/ProfileTripsItems/profile_user_details.dart';
import 'package:flutter_platzi/gradient_back.dart';

class ProfileHeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack("Profile", 350),
        ProfileUserDetails(),
        ProfileActionsList()
      ],
    );
  }
}
