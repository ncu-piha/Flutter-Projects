import 'package:flutter/material.dart';
import 'package:flutter_application_2/utilities/my_button.dart';

class DialogueBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogueBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
          children: [
          //get user input
          TextField(
            controller: controller,
            decoration: const InputDecoration(border: OutlineInputBorder(),
            hintText: "Add a new task",
            
            ),
          ),

          //buttons--> save + cancel
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

          //save button
          MyButton(text: "Save", onPressed:onSave),

          const SizedBox(width: 8),

          //cancel button
          MyButton(text: "Cancel", onPressed:onCancel),

         ],)
        ],),
      ),
    );
  }
}