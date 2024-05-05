import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

import 'package:minimal_chat_app/components/my_button.dart';
import 'package:minimal_chat_app/components/my_textfield.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';

class RegisterPage extends StatelessWidget {
  //email and pw text controllers
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _pwController=TextEditingController();
  final TextEditingController _confirmpwController=TextEditingController();

  //tap to go to login page
  final void Function()? onTap;

   RegisterPage({super.key,required this.onTap,});

   //register method
   void register(BuildContext context){
    //get auth service
    final _auth = AuthService();

    //passowrd match-->create user
    if(_pwController.text == _confirmpwController.text){
      try{
        _auth.signUpWithEmailAndPassword(
          _emailController.text,
          _pwController.text,
          );
      }catch(e){
        showDialog(context: context, builder: (context)=>AlertDialog(
          title: Text(e.toString()),
        ));
      }
    }

    //passowrd dont match --> tell user to fix
    else{
      showDialog(
        context: context,
        builder: (context)=>AlertDialog(
        title: Text("Passowrd don't match!"),
      ));

    }


   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
              ),

              const SizedBox(height: 50,),
        
            //welcome back message
            Text(
              "Let's create an account for you",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 16,
            ),
            
            ),

            const SizedBox(height: 25,),
        
            //email textified
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: _emailController,
              focusNode: FocusNode(),
            ),

            const SizedBox(height: 10,),
        
            //pw textified
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: _pwController,
              focusNode: FocusNode(),
              
              ),

              const SizedBox(height: 10,),

               //consfirmpw textified
            MyTextField(
              hintText: "Confirm Password",
              obscureText: true,
              controller: _confirmpwController,
              focusNode: FocusNode(),
              
              ),

              const SizedBox(height: 25,),
        
            //login button
            MyButton(
              text: "Register",
              onTap: ()=>register(context),
            ),

             const SizedBox(height: 25,),
        
        
            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  ),
                ),
              ],
            ),
          ],
          ),
      ),
      );
  }
}