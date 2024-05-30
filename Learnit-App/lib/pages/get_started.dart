import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnit/pages/user_details.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFF674AEF),
      body: Container(
        width: size.width,
        height: size.height,

        child: Stack(
          children: [
            Stack(
              children: [

                Container(
                  width: size.width,
                  height: size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),

                Container(
                  width: size.width,
                  height: size.height / 1.6,
                  decoration: BoxDecoration(
                    color: Color(0xFF674AEF),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(70))
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'books.png', 
                          scale: 0.8,
                        ),
                      ),

                      SizedBox(height: 30),

                      Text(
                        'LearnIt',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 50,
                          fontFamily: 'PoetsenOne'
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.width,
                height: size.height / 2.666,
                padding: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(70))
                ),

                child: Column(
                  children: [
                    Text(
                      'Learning is Everything',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        letterSpacing: 1,
                        wordSpacing: 2
                      ),
                    ),

                    SizedBox(height: 15),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        'Welcome to LearnIt, your go-to-app for mastering English Language',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),

                    SizedBox(height: 40),

                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 110),
                        decoration: BoxDecoration(
                          color: Color(0xFF674AEF),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      
                      ),

                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>UserDetails())),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}