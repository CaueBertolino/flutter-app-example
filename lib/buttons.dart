import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {

  final Function(String) buttonChangeText;
  
  Buttons({required this.buttonChangeText});


  @override 
  Widget build(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: FloatingActionButton(
            onPressed: (){
              buttonChangeText("prev");
            },
            child: Icon(
              Icons.arrow_left_rounded,
              size: 60,
              color: Colors.black
            ),
            backgroundColor: Color.fromRGBO(251, 211, 52, 1)
          )
        ),
        Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: FloatingActionButton(
            onPressed: (){
              buttonChangeText("next");
            },
            child: Icon(
              Icons.arrow_right_rounded,
              size: 60,
              color: Colors.black
            ),
            backgroundColor: Color.fromRGBO(251, 211, 52, 1)
          )
        )
      ]
    );
  }
}