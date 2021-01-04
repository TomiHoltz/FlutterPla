import 'package:flutter/material.dart';
import 'package:flutter_platzi/HomeTripsItems/review_list.dart';

import 'description_place.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget {

   String descriptionDummy = "Esta es una descripcion de prueba de Marcos Juarez. \n\nUn destino lleno de gente fachera y de laburantes ";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        ListView(
          children: <Widget>[
            DescriptionPlace("Marcos Juarez", 4, descriptionDummy),
            ReviewList(),
          ],
        ),
        HeaderAppBar()
      ],
    );
  }
}
