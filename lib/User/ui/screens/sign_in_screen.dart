import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    userBloc = BlocProvider.of(context);

    return signInGoogleUI();
  }

  Widget signInGoogleUI() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack("", null),
          Column(
            children: <Widget>[
              Text(
                "Welcome \n This is your Travel App",
                style: TextStyle(
                    fontSize: 37,
                    fontFamily: "Lato",
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              ButtonGreen(
                text: "Login with Gmail",
                onPressed: () {
                  userBloc.signIn().then((User user) => print("Username ${user.displayName}")); //Eliminar esto
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
