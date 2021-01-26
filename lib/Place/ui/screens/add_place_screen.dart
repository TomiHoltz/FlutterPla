import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platzi/Place/model/place.dart';
import 'package:flutter_platzi/Place/ui/widgets/card_image.dart';
import 'package:flutter_platzi/Place/ui/widgets/text_input_location.dart';
import 'package:flutter_platzi/User/bloc/bloc_user.dart';
import 'package:flutter_platzi/widgets/button_purple.dart';
import 'package:flutter_platzi/widgets/gradient_back.dart';
import 'package:flutter_platzi/widgets/text_input.dart';
import 'package:flutter_platzi/widgets/title_header.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  File image;
  String screenTitle = "Add a new Place";

  AddPlaceScreen({Key key, this.image});

  @override
  State<StatefulWidget> createState() {
    return _AddPlaceScreen();
  }
}

class _AddPlaceScreen extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();
    final _controllerLocationPlace = TextEditingController();
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    void handleUpload(BuildContext context) async {
      final String uid = (await userBloc.currentUser()).uid;
      if (uid == null) {
        print('Null uid');
        return;
      }

      final uploadTask = userBloc.uploadFile(
          '$uid/${DateTime.now().toString()}.jpg', widget.image);
      if (uploadTask == null) {
        print('Null upload task');
        return;
      }

      final taskSnapshot = await uploadTask;
      if (taskSnapshot == null) {
        print('Null task snapshot');
        return;
      }

      final imageUrl = await taskSnapshot.ref.getDownloadURL();
      if (imageUrl == null) {
        print('Null image URL');
        return;
      }
      print('Image url: $imageUrl');

      //Subimos a Firestore el Place (title, description, urlImg, userOwner, likes...)
      userBloc
          .updatePlaceData(Place(
        name: _controllerTitlePlace.text,
        description: _controllerDescriptionPlace.text,
        urlImage: imageUrl, //firebase storage url
        likes: 0,
      ))
          .whenComplete(() {
        print('Termino la subida de la imagen');
        Navigator.pop(context);
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(gradientHeight: 300),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                  child: Container(
                padding: EdgeInsets.only(top: 45.0, left: 15.0, right: 10.0),
                child: TitleHeader(
                  title: widget.screenTitle,
                ),
              ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: CardImageWithFabIcon(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_alt,
                    width: 350.0,
                    height: 250.0,
                    left: 0.0,
                    onPressedFabIcon: (){},
                  ),
                ), //Foto
                Container(
                  //TextField Title
                  margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: TextInput(
                    hintText: "Title",
                    textInputType: null,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                    hintText: "Description",
                    textInputType: TextInputType.multiline,
                    maxLines: 4,
                    controller: _controllerDescriptionPlace),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: TextInputLocation(
                      controller: _controllerLocationPlace,
                      hintText: "Add Location",
                      iconData: Icons.location_on),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Add Place",
                    onPressed: () {
                      //Id del usuario actual
                      userBloc.currentUser().then((User user) {
                        if (user != null) {
                          //Firebase Storage
                          //Images's URL
                          handleUpload(context);
                        }
                      }); 
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
