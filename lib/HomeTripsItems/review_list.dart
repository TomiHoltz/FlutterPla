import 'package:flutter/material.dart';
import 'package:flutter_platzi/HomeTripsItems/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Review("assets/images/facu.jpg", "Facundo", "1 Review 5 Photos", "Muy buen destino!!!!"),
        Review("assets/images/facu.jpg", "Facundo", "1 Review 5 Photos", "Muy buen destino!!!!"),
        Review("assets/images/facu.jpg", "Facundo", "1 Review 5 Photos", "Muy buen destino!!!!"),

      ],
    );
  }

}