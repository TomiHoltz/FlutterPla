import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_platzi/User/model/user.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PLACE = "places";

  final FirebaseFirestore _db = FirebaseFirestore.instance;

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
}
