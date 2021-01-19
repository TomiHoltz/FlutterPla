import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platzi/User/model/user.dart';
import 'package:flutter_platzi/platzi_trips.dart';
import 'package:flutter_platzi/widgets/gradient_back.dart';
import 'package:flutter_platzi/widgets/button_green.dart';
import 'package:flutter_platzi/User/bloc/bloc_user.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class SignInScreen extends StatefulWidget {
  @override
  State createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  UserBloc userBloc;
  double screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);

    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //Snapshot contiene la data, osea el objeto User traido de Firebase
        if (!snapshot.hasData || snapshot.hasError) {
          return signInGoogleUI();
        } else {
          return PlatziTrips();
        }
      },
    );
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            gradientHeight: null,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
                  width: screenWidth,
                  child: Text(
                    "Welcome, \nThis is your Travel App",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "Lato",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((User user) {
                    userBloc.updateUserData(Userr(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoUrl: user.photoURL,
                    ));
                  });
                },
                width: 300,
                height: 50,
              )
            ],
          )
        ],
      ),
    );
  }
}
