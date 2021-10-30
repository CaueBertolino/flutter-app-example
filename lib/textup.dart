import 'package:flutter/material.dart';

class TextUp extends StatelessWidget {

  final String textup;

  TextUp({required this.textup});

  @override 
  Widget build(BuildContext context){
    return Container(
      child: Text(
        textup,
        style: TextStyle(
          fontSize: 27.5,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center
      ),
      margin: EdgeInsets.all(25)
    );
  }
}