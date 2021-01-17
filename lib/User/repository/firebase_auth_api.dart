import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<User> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    UserCredential userCredential = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: gSA.idToken, accessToken: gSA.accessToken));

    return userCredential.user;

    //Nosotros queremos retornar lo que antes era un FirebaseUser, pero FirebaseUser quedo obsoleto.
    //Ahora creamos un UserCredential y esa credencial va a tener el user adentro (userCredential.user)

    //Tengamos en cuenta que cuando iniciamos sesion se inicia tanto en Firebase como en Google
    //Por el eso en el signOut() cerramos las dos
  }

  signOut() async {
    await _auth.signOut().then((value) => print("Sesion Cerrada"));
    googleSignIn.signOut();
    print("Sesion Cerrada");
  }
}
