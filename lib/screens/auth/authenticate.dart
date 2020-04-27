import 'package:flutter/material.dart';
import 'package:flutter_login_and_crud_with_firebase/screens/auth/signIn.dart';
import 'package:flutter_login_and_crud_with_firebase/screens/auth/signUp.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;

  void toggleScreen() {
    setState(() {
      showSignIn = !showSignIn;
      print('Changed');
    });
  }
  @override
  Widget build(BuildContext context) {
    
      if(showSignIn) {
        return SignIn(toggleView : toggleScreen);
      }else{
        return SignUp(toggleView : toggleScreen);
      }
    
    
  }
}