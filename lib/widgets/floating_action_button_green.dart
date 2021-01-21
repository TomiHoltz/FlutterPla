import 'package:flutter/material.dart';

class FloatinActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  FloatinActionButtonGreen({
    Key key,
    @required this.iconData,
    @required this.onPressed
  });

  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatinActionButtonGreen> {
  IconData icon;

  bool get wantKeepAlive => true;

  void initState() {
    super.initState();
    this.icon = widget.iconData;
  }

  /*void onPressedFav() {
    setState(() {
      if (this.icon == Icons.favorite_border) {
        this.icon = Icons.favorite;
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Agregaste un Favorito")));
      } else {
        this.icon = Icons.favorite_border;
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text("Eliminaste un favorito")));
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Fav",
      onPressed: widget.onPressed,
      child: Icon(this.icon),
      heroTag: null,
    );
  }
}
