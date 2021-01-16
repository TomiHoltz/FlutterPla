import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platzi/Place/ui/screens/home_trips.dart';
import 'package:flutter_platzi/User/bloc/bloc_user.dart';
import 'package:flutter_platzi/User/ui/screens/profile_trips.dart';
import 'package:flutter_platzi/Place/ui/screens/search_trips.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class PlatziTripsCupertino extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      bottomNavigationBar: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, color: Colors.indigo), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.indigo), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.indigo), label: ""),
          ],
        ),
        tabBuilder: (BuildContext context, int index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (BuildContext context) => HomeTrips(),
              );
            case 1:
              return CupertinoTabView(
                builder: (BuildContext context) => SearchTrips(),
              );
            case 2:
              return CupertinoTabView(
                builder: (BuildContext context) {
                  return BlocProvider<UserBloc>(
                    child: ProfileTrips(), 
                    bloc: UserBloc()
                  );
                }
              );
          }
        },
      ),
    );
  }
}
