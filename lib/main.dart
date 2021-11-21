import 'package:adaptive_app/models/todo.dart';
import 'package:adaptive_app/widgets/buttons.dart';
import 'package:adaptive_app/widgets/new_todo.dart';
import 'package:uuid/uuid.dart';
import 'package:adaptive_app/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'widgets/textup.dart';
import 'widgets/textdown.dart';


void main (){
  runApp(
    MaterialApp(
      home: MyApp()
    )
  );
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
    {'textUp': 'Buy Crypto', 'textDown': 'It is still not too late'},
    {'textUp': 'Data is the new oil', 'textDown': 'Every company is a data company'}
  ];

  var _textIndex = 0;

  final List<Todo> todos = [
    Todo(id: Uuid(), title: "Who watches the watchmen?", completed: true),
    Todo(id: Uuid(), title: "Killing in the name of", completed: false),
    Todo(id: Uuid(), title: "Turn coffee into code", completed: true)
  ];

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

  void showAddTodoModal(BuildContext context){
    showModalBottomSheet(context: context, builder: (BuildContext context) {
      return NewTodo(addTodo: addTodo);
    });
  }

  void addTodo(String todo){
    setState(() {
      
      todos.add(Todo(
        id: Uuid(),
        title: todo,
        completed: false
      ));

    });
  }

  void _updateTodoCompletions(int index){
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  //Main Widget
  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextUp(textup: _texts[_textIndex]['textUp'] as String),
            TextDown(textdown: _texts[_textIndex]['textDown'] as String),
            Buttons(buttonChangeText: _buttonChangeText),
            TodoList(todos: todos, updateTodoCompletions: _updateTodoCompletions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddTodoModal(context);
        },
        child: Icon(Icons.add)
      ),
    );
  }
}