import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_platzi/Place/model/place.dart';
import 'package:flutter_platzi/User/model/user.dart';
import 'package:flutter_platzi/User/repository/cloud_firestore_api.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(Userr user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);
}
