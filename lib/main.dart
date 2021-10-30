import 'package:adaptive_app/buttons.dart';
import 'package:flutter/material.dart';
import './textup.dart';
import './textdown.dart';


void main (){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }

}


class _MyAppState extends State<MyApp> {

  //variables declaration
  var _texts = [
    {'textUp': 'Hello World', 'textDown': 'App Example'},
    {'textUp': 'Simple Phrase Changing APP', 'textDown': 'The text changes when the arrows are pressed'},
    {'textUp': 'Data is the new oil', 'textDown': 'Flutter testing / studies'}
  ];

  var _textIndex = 0;

  //functions declaration
  void _buttonChangeText(String direction){
    if(direction == "next"){
      if(_textIndex != _texts.length -1){
        setState( (){
          _textIndex ++;
        });
      } else {
        setState((){
          _textIndex = 0;
        });
      }
    } else if(direction == "prev"){
      if(_textIndex != 0){
        setState((){
          _textIndex --;
        });
      } else {
        setState((){
          _textIndex = _texts.length -1;
        });
      }
    }

  }

  @override
  Widget build(BuildContext context){
    
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextUp(textup: _texts[_textIndex]['textUp'] as String),
              TextDown(textdown: _texts[_textIndex]['textDown'] as String),
              Buttons(buttonChangeText: _buttonChangeText)
            ],
          ),
        )
      )
    );
  }
}