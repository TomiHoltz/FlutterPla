import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_platzi/Place/model/place.dart';
import 'package:flutter_platzi/Place/repository/firebase_storage_repository.dart';
import 'package:flutter_platzi/User/model/user.dart';
import 'package:flutter_platzi/User/repository/cloud_firestore_api.dart';
import 'package:flutter_platzi/User/repository/cloud_firestore_repository.dart';
import 'package:flutter_platzi/User/ui/widgets/profile_place.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_platzi/User/repository/auth_repository.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Flujo de datos -Streams
  //Stream - Firebase
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;
  Future<User> currentUser() async {
    User user = FirebaseAuth.instance.currentUser;
    return user;
  }

  //Casos de uso
  //1.SignIn a la App con googlevy firebase
  Future<User> signIn() => _auth_repository.signInFirebase();

  //2.SignOut de google con firebase
  signOut() => _auth_repository.signOut();

  //3. Registrar usuario en DB
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(Userr user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  //4.Añadir un nuevo Place
  Future<void> updatePlaceData(Place place) =>
      _cloudFirestoreRepository.updatePlaceDataFirestore(place);

  //Traer la lista de places actualizada
  Stream<QuerySnapshot> placesListStream = FirebaseFirestore.instance
      .collection(CloudFirestoreAPI().PLACES)
      .snapshots();
  Stream<QuerySnapshot> get placeStream => placesListStream;
  List<ProfilePlace> buildPlaces(List<DocumentSnapshot> placesListSnapshot) =>
      _cloudFirestoreRepository.buildPlaces(placesListSnapshot);

  //Enviar archivos a FirebaseStorage
  final _firebaseStorageRepository = FirebaseStorageRepository();
  uploadFile(String path, File image) async =>
      _firebaseStorageRepository.uploadFile(path, image);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
