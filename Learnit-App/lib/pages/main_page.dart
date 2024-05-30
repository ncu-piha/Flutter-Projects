import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnit/pages/grammar.dart';
import 'package:learnit/pages/quotes.dart';
import 'package:learnit/pages/saveduser.dart';
import 'package:learnit/pages/vocabulary.dart';
import 'package:learnit/pages/vocabularyquiz.dart';
import 'package:learnit/utility/userinfo.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Consumer<Userinfo>(
      builder: (context, userInfo, child) {

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,

              children: [
                Container(
                  padding: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: Color(0xFF674AEF),
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_rounded),
                            color: Colors.white,
                            iconSize: 30,
                          ),
                        ],
                      ),

                      SizedBox(height: 25),

                      Padding(
                        padding: EdgeInsets.only(bottom: 12, left: 10),
                        child: Text(
                          'Hello, ${userInfo.name}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                            fontFamily: 'PoetsenOne',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),

                Container(
                  child: GridView.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 30,
                    padding: EdgeInsets.all(20),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2, 
                    children: [

                      GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color.fromARGB(255, 247, 186, 44), Color.fromARGB(171, 235, 57, 63)],

                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                        
                            borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        
                            children: [
                              Image.asset(
                                height: 110,
                                'vocab.png'
                              ),
                        
                              SizedBox(height: 20),
                        
                              Text(
                                'Vocabulary',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                        
                            ],
                          )
                        ),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Vocabulary()));
                        },

                      ),

                      GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                        
                              colors: [Color.fromARGB(255, 155, 248, 243), Color.fromARGB(177, 9, 117, 241)],
                        
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                        
                            borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        
                            children: [
                              Image.asset(
                                height: 110,
                                'grammmmmer.png'
                              ),
                        
                              SizedBox(height: 20),
                        
                              Text(
                                'Grammar',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                        
                            ],
                          )
                        ),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Grammar()));
                        },
                      ),

                      GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(66, 83, 231, 0.71), 
                                Color.fromRGBO(203, 134, 210, 0.98), 
                              ],                           
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                        
                            borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        
                            children: [
                              Image.asset(
                                height: 110,
                                'prooooooo.png'
                              ),
                        
                              SizedBox(height: 20),
                        
                              Text(
                                'Quotes',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                        
                            ],
                          )
                        ),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Quotes()));
                        },
                      ),

                      GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(231, 66, 170, 1), 
                                Color.fromRGBO(244, 222, 222, 0.98), 
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                        
                            borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        
                            children: [
                              Image.asset(
                                height: 110,
                                'wooooooorrrdddss.png'
                              ),
                        
                              SizedBox(height: 20),
                        
                              Text(
                                'Saved Words',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                        
                            ],
                          )
                        ),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Saveduser()));
                        },
                      ),

                      GestureDetector(
                        child: Container(
                          height: 100,
                          width: 100,
                          
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                  Color.fromRGBO(231, 212, 66, 1), 
                                  Color.fromRGBO(193, 251, 196, 0.976), 
                                ],
                        
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                        
                            borderRadius: BorderRadius.all(Radius.circular(40))
                          ),
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                        
                            children: [
                              Image.asset(
                                height: 110,
                                'quizzzzz.png'
                              ),
                        
                              SizedBox(height: 20),
                        
                              Text(
                                'Quizzes',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                        
                            ],
                          )
                        ),

                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>VocabularyQuizScreen()));
                        },

                      ),

                  
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
