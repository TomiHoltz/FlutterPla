import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_platzi/User/model/user.dart';
import 'package:flutter_platzi/User/repository/cloud_firestore_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_platzi/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Flujo de datos -Streams
  //Stream - Firebase
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  //Casos de uso
  //1.SignIn a la App con googlevy firebase
  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  //2.SignOut de google con firebase
  signOut() {
    _auth_repository.signOut();
  }

  //3. Registrar usuario en DB
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(Userr user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
