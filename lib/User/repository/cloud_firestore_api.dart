import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_platzi/Place/model/place.dart';
import 'package:flutter_platzi/User/model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACES = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void updateUserData(Userr user) async {
    DocumentReference ref = _db.collection(USERS).doc(user.uid);

    /*CollectionReference users = _firestore.collection(USERS);
    DocumentReference ref = users.doc(user.uid);
    Alternativa a lo anterior que vi en un comentario en Platzi*/

    return ref.set({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoUrl,
      'myPlaces': user.myPlaces,
      'myFavouritePlaces': user.myFavouritePlaces,
      'lastSignIn': DateTime.now()
    }, SetOptions(merge: true));
  }

  Future<void> updatePlaceData(Place place) async {
    CollectionReference refPlaces = _db.collection(PLACES);

    String uid = (await _auth.currentUser).uid;

    await refPlaces.add({
      'name': place.name,
      'description': place.description,
      'likes': place.likes,
      'userOwner': _db.doc("${USERS}/$uid"), //reference
      'urlImage': place.urlImage
    }).then((DocumentReference _dr) {
      _dr.get().then((DocumentSnapshot snapshot) {
        DocumentReference placeRef = snapshot.reference;
        DocumentReference refUsers = _db.collection(USERS).doc(uid);
        refUsers.update({
          'myPlaces' :  FieldValue.arrayUnion([placeRef])
        });
      });
    });
  }
}
