import 'package:flutter/material.dart';
import 'package:flutter_login_and_crud_with_firebase/helpers/auth.dart';
import 'package:flutter_login_and_crud_with_firebase/public/loader.dart';

class SignUp extends StatefulWidget {

    final Function toggleView;

  SignUp({this.toggleView});


  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  
   final AuthService _authService = AuthService();
   final _formkey = GlobalKey<FormState>();
     bool waiting = false;
    String email = '';
    String password = '';
    String error = '';
  
  @override
  Widget build(BuildContext context) {
    return waiting ? Loader() : Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
          actions : <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleView();

          }, icon: Icon (Icons.person,color: Colors.white,), label: Text('Sign In', style : TextStyle(color:Colors.white,fontSize: 16,fontWeight: FontWeight.w300)), )
        ],
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Sign Up with Auth'
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
                  obscureText: true,
                  validator: (val) => val.length < 8 ? 'Passowrd Should 8 Charaters' : null,
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                  
                ),
                SizedBox(height:  20.0),                
                  FlatButton.icon(onPressed: ()async {
                        if(_formkey.currentState.validate()){
                          setState(() {
                        waiting = true;
                      });
                          dynamic result = await _authService.signUpWithEmailandPassword(email, password);
                          if(result == null){
                              setState(() {
                                waiting = false;
                                error = 'Credientials are not valid';
                              });
                          }
                        }
                     },
                      icon: Icon (
                          Icons.person,
                            color: Colors.white,
                            ),
                       label: Text(                         
                         'Sign Up', style: TextStyle(color:Colors.white),
                         ), 
                         color: Colors.blueAccent,
                         ),
                         SizedBox(height:  20.0),
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