import 'package:flutter/material.dart';

class FloatingActionButtonWhiteMini extends StatefulWidget {

  IconData iconSelected1;
  String bottomTooltip1;

  FloatingActionButtonWhiteMini(this.iconSelected1, this.bottomTooltip1);

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return _FloatingActionButtonWhiteMini(iconSelected1, bottomTooltip1);
  }
}

class _FloatingActionButtonWhiteMini
    extends State<FloatingActionButtonWhiteMini> {
  IconData iconSelected;
  String bottomTooltip;

  _FloatingActionButtonWhiteMini(this.iconSelected, this.bottomTooltip);

  void onPressedBottom() {
    setState(() {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Accion no disponible")));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Colors.white,
      mini: true,
      tooltip: bottomTooltip,
      onPressed: onPressedBottom,
      child: Icon(this.iconSelected, color: Colors.indigo,),
    );
  }
}
