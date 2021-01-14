import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:flutter_platzi/User/repository/auth_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();

  //Flujo de datos -Streams
  //Stream - Firebase
  Stream<User> streamFirebase = FirebaseAuth.instance.authStateChanges();
  Stream<User> get authStatus => streamFirebase;

  //Casos de uso
  //1.SignIn a la App con google
  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
