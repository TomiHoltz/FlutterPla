import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_platzi/Place/ui/screens/add_place_screen.dart';
import 'package:flutter_platzi/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'circle_button.dart';

class ButtonsBar extends StatelessWidget {
  UserBloc userBloc;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
        child: Row(
          children: <Widget>[
            //Cambiar contraseña (No implementado porque solo entramos desde Gmail)
            CircleButton(true, Icons.vpn_key, 20.0,
                Color.fromRGBO(255, 255, 255, 0.6), () => {}),
            //Añadir nuevo lugar
            CircleButton(
                false, Icons.add, 40.0, Color.fromRGBO(255, 255, 255, 1), () {
              picker
                  .getImage(source: ImageSource.camera)
                  .then((PickedFile image) {
                if (image.path == null) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            AddPlaceScreen(image: File(image.path))));
                }
              }).catchError((onError) => print(onError));
            }),
            //Sign out
            CircleButton(
              true,
              Icons.exit_to_app,
              20.0,
              Color.fromRGBO(255, 255, 255, 0.6),
              () => {userBloc.signOut()},
            )
          ],
        ));
  }
}
