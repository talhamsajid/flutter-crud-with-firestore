
import 'package:flutter/material.dart';
import 'package:flutter_login_and_crud_with_firebase/model/user.dart';
import 'package:flutter_login_and_crud_with_firebase/screens/auth/authenticate.dart';
import 'package:provider/provider.dart';
import 'homeScreen/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    if(user == null){
      print('Not Signed In');
      return Authenticate();
    }else{
      return Home();
    }
    // return either the Home or Authenticate widget
    
    
  }
}