import 'package:flutter/material.dart';

class FloatingActionButtonWhite extends StatefulWidget {

  IconData iconSelected1;
  String bottomTooltip1;

  FloatingActionButtonWhite(this.iconSelected1, this.bottomTooltip1);

  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return _FloatingActionButtonWhite(iconSelected1, bottomTooltip1);
  }
}

class _FloatingActionButtonWhite
    extends State<FloatingActionButtonWhite> {
  IconData iconSelected;
  String bottomTooltip;

  _FloatingActionButtonWhite(this.iconSelected, this.bottomTooltip);

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
      mini: false,
      tooltip: bottomTooltip,
      onPressed: onPressedBottom,
      child: Icon(this.iconSelected, color: Colors.indigo),
    );
  }
}