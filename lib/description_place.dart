import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DescriptionPlace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final text_description = Text(
      "Lorem ipsum dolor sit amet consectetur adipiscing elit auctor, sapien leo praesent etiam iaculis metus ut, consequat lacinia taciti ultrices at tellus integer. Nulla ad conubia donec senectus netus ultrices semper, metus malesuada ridiculus mollis varius himenaeos tellus, potenti habitasse natoque phasellus integer tristique.",
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w300,
        color: Colors.black38
      ),
      textAlign: TextAlign.left,
    );

    final star = Container(
      margin: EdgeInsets.only(
        top: 223.0,
        right: 3.0,
      ),
      child: Icon(
        Icons.star,
        color: Color(0xFFf2C611),
      ),
    ); //Objeto estrella

    final title_star = Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            top: 220.0,
            left: 20.0,
            right: 20.0
          ),

          child: Text(
            "Duwili Ella",
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            ),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: <Widget>[
            star,
            star,
            star,
            star,
            star,
          ],
        )
      ],
    ); //Titulo del Lugar con la calificacion en estrellas

    final description = Container(
      margin: EdgeInsets.only(
        top: 20.0,
        right: 20.0,
        left: 20.0
      ),
      child: text_description
    );

    return Column(
      children: <Widget>[
        title_star,
        description
      ],
    );
  }
   
}