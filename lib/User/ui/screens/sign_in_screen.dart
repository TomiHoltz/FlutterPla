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
  double screenWidht;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    screenWidht = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession(){
    return StreamBuilder(
      stream: userBloc.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //snapshot- data - Object User
        if(!snapshot.hasData || snapshot.hasError) {
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
          GradientBack(gradientHeight: null),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  width: screenWidht,
                  child: Text("Welcome \nThis is your Travel App",
                    style: TextStyle(
                        fontSize: 34.0,
                        fontFamily: "Lato",
                        color: Colors.white,
                        fontWeight: FontWeight.bold


                    ),
                  ),
                ),
              ),

              ButtonGreen(text: "Login with Gmail",
                onPressed: () {
                  userBloc.signOut();
                  userBloc.signIn().then((User user) {
                    userBloc.updateUserData(Userr(
                      uid: user.uid,
                      name: user.displayName,
                      email: user.email,
                      photoUrl: user.photoURL
                    ));
                  });

                },
                width: 300.0,
                height: 50.0,
              )

            ],
          )
        ],
      ),
    );
  }
}
