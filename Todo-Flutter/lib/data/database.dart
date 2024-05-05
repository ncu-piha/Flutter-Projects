import 'package:hive_flutter/adapters.dart';

class ToDoDataBase{

  List toDoList=[];
  //reference our box
  final _myBox=Hive.box("mybox");

 //run this method if this is the 1st timr ever epening this app
  void createInitialData(){
    toDoList=[
      ["Make Tutorisl",false],
      ["Do excercise",false]

    ];

  }

  //load the data from database
  void loadData(){
    toDoList=_myBox.get("TODOLIST");

  }

  //update the database
  void updateDataBase(){
    _myBox.put("Todolist", toDoList);

  }
}