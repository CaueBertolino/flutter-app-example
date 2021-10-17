import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }

}


class MyAppState extends State {

  //variables declaration
  var texts = [
    {'textUp': 'Hello World', 'textDown': 'App Example'},
    {'textUp': 'Simple Phrase Changing APP', 'textDown': 'The text changes when the arrows are pressed'},
    {'textUp': 'Data is the new oil', 'textDown': 'Flutter testing / studies'}
  ];
  var textIndex = 0;

  //functions declaration
  buttonChangeText(String direction){
    if(direction == "next"){
      if(textIndex != texts.length -1){
        setState( (){
          textIndex ++;
        });
      } else {
        setState( (){
          textIndex = 0;
        });
      }
    } else if(direction == "prev"){
      if(textIndex != 0){
        setState( (){
          textIndex --;
        });
      } else {
        setState( (){
          textIndex = texts.length -1;
        });
      }
    }

  }


  Widget build(BuildContext context){
    
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Text(
                  texts[textIndex]['textUp'] as String,
                  style: TextStyle(
                    fontSize: 27.5,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center
                ),
                margin: EdgeInsets.all(25)
              ),
              Container(
                child: Text(
                  texts[textIndex]['textDown'] as String,
                  style: TextStyle(
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center
                ),
                margin: EdgeInsets.fromLTRB(15, 25, 15, 45)
              ),
              Row(
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
                ])
            ],
          ),
        )
      )
    );

  }

}