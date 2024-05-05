
import 'package:flutter/material.dart';
import 'package:minimal_chat_app/components/user_tile.dart';
import 'package:minimal_chat_app/pages/chat_page.dart';
import 'package:minimal_chat_app/services/auth/auth_service.dart';
import 'package:minimal_chat_app/services/chat/chat_service.dart';


class HomePage extends StatelessWidget {
   HomePage({super.key});

  //chat and auth serivices 
  final ChatService _chatService=ChatService();
  final AuthService _authService=AuthService();

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: const Drawer(),
      body: _buildUserList(),
    );
  }

  //buid a list of users except for the current looged in user

  Widget _buildUserList(){
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
       builder: (context,snapshot){
        //error
        if(snapshot.hasError){
          return const Text("Error");
        }

        //loading..
        if(snapshot.connectionState==ConnectionState.waiting){
          return const Text("Loading");
        }

        //return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData,context)).toList(),
        );
       }
       );
  }

  //build individual list title for user 
  Widget _buildUserListItem(Map<String,dynamic> userData,BuildContext context){
    //display all users except current user
    if(userData["email"]!=_authService.getCurrentUser()!.email){
      return UserTile(
      text: userData["email"],
      onTap: (){
        //tapped on a user --> go to chat page 
        Navigator.push(context, MaterialPageRoute(builder:(context)=>ChatPage(
          receiverEmail: userData["email"],
          receiverID: userData["uid"],
        ), ));
      },
    );
    }else{
      return Container();

    }
  }

}