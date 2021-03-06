import 'package:flutter/material.dart';
import 'package:flutter_platzi/User/bloc/bloc_user.dart';
import 'package:flutter_platzi/User/ui/screens/profile_trips.dart';
import 'package:flutter_platzi/Place/ui/screens/search_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'Place/ui/screens/home_trips.dart';

//Here is the BottomNavigationBar with the function who makes it changes the screens

class PlatziTrips extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PlatziTrips();
  }
}

class _PlatziTrips extends State<PlatziTrips> {
  int indexTap = 0;
  UserBloc userBloc;

  final List<Widget> widgetsChildren = [
    HomeTrips(),
    SearchTrips(),
    BlocProvider<UserBloc>(bloc: UserBloc(), child: ProfileTrips())
  ];

  void onTapTapped(int index) {
    setState(() {
      indexTap = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Colors.purple,
        ),
        child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            onTap: onTapTapped,
            currentIndex: indexTap,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
            ]),
      ),
    );
  }
}
