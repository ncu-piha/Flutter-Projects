import 'package:flutter/material.dart';
import 'package:learnit/pages/main_page.dart';
import 'package:learnit/utility/userinfo.dart';
import 'package:provider/provider.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {

  var formKey = GlobalKey<FormState>();

  var selectedExperience = 'Beginner';

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Userinfo>(
      builder: (context, userInfo, child) {

        return Scaffold(
          body: ListView(
            children: [

              Container(
                padding: EdgeInsets.only(top:15, bottom: 10, left: 15, right: 15 ),
                decoration: BoxDecoration(
                  color: Color(0xFF674AEF),
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))
                ),

                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        IconButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          
                          icon: Icon(Icons.arrow_back_rounded),
                          color: Colors.white,
                          iconSize: 30,
                        )
                      ],
                    ),

                    SizedBox(height: 25),

                    Padding(
                      padding: EdgeInsets.only(bottom: 12),

                      child: Text(
                        'Please Enter Your Details',

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          fontFamily: 'PoetsenOne'
                        ),
                      ),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),

                decoration: BoxDecoration(
                  color: Color.fromARGB(191, 99, 66, 243),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),

                child: Form(

                  key: formKey,

                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              controller: _nameController,
                              style: TextStyle(
                                fontSize: 18
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                prefixIcon: Icon(Icons.person),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty || !RegExp(r'^[a-zA-Z ]+$').hasMatch(value)){
                                  return 'Enter a valid name';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 20),
                    
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Email Address',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 10),

                            TextFormField(
                              controller: _emailController,
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter your email',
                                prefixIcon: Icon(Icons.email),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              validator: (value){
                                if(value!.isEmpty || !RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(value)){
                                  return 'Enter valid email address';
                                }
                                else{
                                  return null;
                                }
                              },
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Past Experience',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                            SizedBox(height: 10),
                            DropdownButtonFormField<String>(
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              value: selectedExperience, // Define a variable to track the selected value
                              onChanged: (newValue) {
                                setState(() {
                                  selectedExperience = newValue!; // Update the selected value
                                });
                              },
                              items: [
                                DropdownMenuItem(
                                  value: 'Beginner',
                                  child: Text('Beginner'),
                                ),
                                DropdownMenuItem(
                                  value: 'Intermediate',
                                  child: Text('Intermediate'),
                                ),
                                DropdownMenuItem(
                                  value: 'Expert',
                                  child: Text('Expert'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              GestureDetector(
                child: Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 110),
                    decoration: BoxDecoration(
                      color: Color(0xFF674AEF),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins'
                      ),
                    ),
                  
                  ),
                ),

                onTap: () => {
                  

                  if(formKey.currentState!.validate()){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage())),
                  },

                  


                  userInfo.changeName(_nameController.text),

                  userInfo.changeEmail(_emailController.text),

                  setState(() {
                    
                  })
                },
              ),

            ],
          )
        );
      },
    );
  }
}