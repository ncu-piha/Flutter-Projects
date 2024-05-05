import 'package:flutter/material.dart';
import 'package:flutter_application_2/data/database.dart';
import 'package:flutter_application_2/utilities/dialogue_box.dart';
import 'package:flutter_application_2/utilities/todo_tile.dart';
import 'package:hive_flutter/adapters.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox=Hive.box("mybox");
   ToDoDataBase db=ToDoDataBase();

   @override
  void initState() {
    //if this is first time ever opening app ,then create default data
    if(_myBox.get("TODOLIST")==null){
      db.createInitialData();

    }else{
      //there already exists data
      db.loadData();
    }
    super.initState();
  }


  //text controller
  final _controller=TextEditingController();
 


  //list of todo tasks
  // List toDoList=[
  //   ["Make tutorial",false],
  //   ["Do excercise",false],
  // ];
  //check box tapped
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1]=!db.toDoList[index][1];
    });
    db.updateDataBase();

  }
//save new task
void saveNewTask(){
  setState(() {
    db.toDoList.add([_controller.text,false]);
    _controller.clear();
  });
  Navigator.of(context).pop();
  db.updateDataBase();
}

  //create new task
  void createNewTask(){
    showDialog(
      context: context, 
      builder: (context){
        return DialogueBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: ()=>Navigator.of(context).pop(),
        );
      }
      );
  }
//delete task
void deleteTask(int index){
  setState(() {
    db.toDoList.removeAt(index);
  });
db.updateDataBase();
}

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
          child:const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context,index){
          return ToDoTile(taskName: db.toDoList[index][0], taskCompleted: db.toDoList[index][1], 
          onChanged:(value)=> checkBoxChanged(value,index),
          deleteFunction: (context)=>deleteTask,
          );
        },
      ),
    );
  }
}