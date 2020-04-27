import 'package:flutter/material.dart';
import 'package:flutter_login_and_crud_with_firebase/helpers/auth.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;

  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions : <Widget>[
          FlatButton.icon(onPressed: (){          
            widget.toggleView();
          }, icon: Icon (Icons.person_add,color: Colors.white,), label: Text('Sign Up', style: TextStyle(color: Colors.white),), )
        ],
                title: Text(
          'Sign In with Auth'
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 25 , horizontal: 40),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                 TextFormField(
                   decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  onChanged: (val){
                  setState(()  {
                    email = val;
                  });
                  }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  validator: (val) => val.length < 8 ? 'Passowrd Should 8 Charaters' : null,
                  obscureText: true,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                  
                ),
                SizedBox(height:  20.0),
              
                  FlatButton.icon(onPressed: ()async{
                    if(_formkey.currentState.validate()){
                      dynamic result = await _authService.signInEmailAndPassword(email, password);
                      if(result == null){
                         error = 'Email and Password are Wrong';
                      }
                    }
            

          }, icon: Icon (Icons.person,color: Colors.white70,), label: Text('Sign In',style: TextStyle(color: Colors.white),), color: Colors.blueAccent, )
       ,
       SizedBox(height: 20.0,),
       Text(error,
       style: TextStyle(color: Colors.redAccent),),
       
               
               
              ]
            ),
          ),
          //    

        ),
    );
  }
}