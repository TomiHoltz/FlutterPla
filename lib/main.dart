import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platzi/Place/bloc/bloc_place.dart';
import 'package:flutter_platzi/User/bloc/bloc_user.dart';
import 'package:flutter_platzi/User/ui/screens/sign_in_screen.dart';
import 'package:flutter_platzi/platzi_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String AppTitle = "Platzi Trips";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: BlocProvider(
            child: MaterialApp(
                title: AppTitle,
                theme: ThemeData(
                  primarySwatch: Colors.blue,
                ),
                //home: PlatziTrips()),
                home: SignInScreen()),
            bloc: PlaceBloc()),
        bloc: UserBloc());
  }
}
