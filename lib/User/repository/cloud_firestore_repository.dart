import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_platzi/Place/model/place.dart';
import 'package:flutter_platzi/Place/ui/widgets/card_image.dart';
import 'package:flutter_platzi/User/model/user.dart';
import 'package:flutter_platzi/User/repository/cloud_firestore_api.dart';
import 'package:flutter_platzi/User/ui/widgets/profile_place.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();

  void updateUserDataFirestore(Userr user) =>
      _cloudFirestoreAPI.updateUserData(user);

  Future<void> updatePlaceDataFirestore(Place place) =>
      _cloudFirestoreAPI.updatePlaceData(place);

  List<ProfilePlace> buildMyPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildMyPlaces(placesListSnapshot);

  List<CardImageWithFabIcon> buildPlaces(
          List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreAPI.buildPlaces(placesListSnapshot);
}
