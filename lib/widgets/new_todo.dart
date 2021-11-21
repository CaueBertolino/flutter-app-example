import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NewTodo extends StatefulWidget{

  final Function(String) addTodo;

  NewTodo({required this.addTodo});


  @override
  State<StatefulWidget> createState() => NewTodoState();

}

class NewTodoState extends State<NewTodo> {

  TextEditingController _todoController = TextEditingController();

  @override
  Widget build(BuildContext context){

    return Container(
        height: double.infinity,
        margin: EdgeInsets.all(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children:<Widget>[
            TextField(
              controller: _todoController,
              decoration: InputDecoration(
                labelText: "New Task"
              )
            ),
            TextButton(
              onPressed: (){
                widget.addTodo(_todoController.text);
                Navigator.of(context).pop();
              }, 
              child: Text("Add")
            )
          ]
        )
    );
  }
}
