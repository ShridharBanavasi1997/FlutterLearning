import 'dart:math';

import "package:flutter/material.dart";

class FirstScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text(
          generateLuckNumber(),
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
          ),
        ),
      ),
    );
  }

  String generateLuckNumber(){
    var randem = Random();
    int luckNum = randem.nextInt(10);

    return "Your Lucky Number is: $luckNum";
  }

}