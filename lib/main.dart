import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platzi/platzi_trips.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String AppTitle = "Platzi Trips";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: AppTitle,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: PlatziTrips());
  }
}
