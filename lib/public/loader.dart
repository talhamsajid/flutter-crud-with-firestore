import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child : Center( 
        child:
    SpinKitChasingDots(
  
          
  
          color: Colors.white,
  
          size : 60.0,
  
        ),

    )
    );
  }
}