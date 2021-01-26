import 'package:flutter/material.dart';
import 'package:flutter_platzi/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Container(
        height: 350.0,
        child: StreamBuilder(
          stream: userBloc.placeStream,
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CircularProgressIndicator();
              case ConnectionState.none:
                return CircularProgressIndicator();
              case ConnectionState.active:
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs));
              case ConnectionState.done:
                return listViewPlaces(userBloc.buildPlaces(snapshot.data.docs));
              default:
            }
          },
        ));
  }

  Widget listViewPlaces(List<CardImageWithFabIcon> placesCard) {
    return ListView(
      padding: EdgeInsets.all(25.0),
      scrollDirection: Axis.horizontal,
      children: placesCard,
    );
  }
}
