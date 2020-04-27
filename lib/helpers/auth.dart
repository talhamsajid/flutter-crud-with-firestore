import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_and_crud_with_firebase/model/user.dart';

class AuthService {
  // register with email and password

  // sign out




  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user from firebase

  User _userFromFirebase(FirebaseUser user){
    return user != null ? User(userId: user.uid) : null ;
  } 

  //Authenication Userchange

  Stream<User> get user {

    return _auth.onAuthStateChanged.map(_userFromFirebase);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;

      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//sign in with email and password
Future signInEmailAndPassword(String email , String pass) async{
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    FirebaseUser user = result.user;
    return _userFromFirebase(user);
  }catch(e){
    print(e.toString());
    return null;
  }
}

//New User

Future signUpWithEmailandPassword(String  email , String  pass) async {
  try{
    AuthResult authResult = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    FirebaseUser firebaseUser = authResult.user;
    return _userFromFirebase(firebaseUser);
  }catch(e){
    print(e.toString());
    return null;
  }
}

//Logout Function

Future logOut() async {
try{
  return await _auth.signOut();
}catch(e){
  print(e.toString());
  return null; 
}
}

}