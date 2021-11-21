import 'package:flutter/material.dart';

class TextDown extends StatelessWidget {

  final String textdown;

  TextDown({required this.textdown});

  @override 
  Widget build(BuildContext context){
    return Container(
      child: Text(
        textdown,
        style: TextStyle(
          fontSize: 20
        ),
        textAlign: TextAlign.center
      ),
      margin: EdgeInsets.fromLTRB(15, 25, 15, 45)
    );
  }
}