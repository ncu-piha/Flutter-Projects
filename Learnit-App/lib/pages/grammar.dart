import 'package:flutter/material.dart';

class Grammar extends StatelessWidget {
  const Grammar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 15, bottom: 10, left: 15, right: 15),
            decoration: BoxDecoration(
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)
              )
            ),
            child: Column(
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
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Grammer Rules',
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

          SizedBox(height: 20),

          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(

              children: [
                
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(167, 255, 150, 112),
                  ),

                  child: Column(

                    children: [
                      Text(
                        '1. Subject-verb agreement 🖊 ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 100, 44, 23),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PoetsenOne'
                        ),
                      ),
                      
                      SizedBox(height: 20),
                      
                      Text(
                        'In English sentences, subjects and verbs must be in sync. When they agree in number, sentences flow with a natural rhythm, establishing logical coherence. For example, this grammar rule is why we write "The dog chases its tail" (singular subject, singular verb) and not "The dog chase its tail" (singular subject, plural verb). And don’t get confused with the "s" at the end of the verb –– adding the "s" doesn’t make it plural. ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 180, 255, 165),
                  ),
                  child: Column(

                    children: [
                      Text(
                        '2. Adjectives and adverbs 📓',
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 75, 5),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PoetsenOne'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      
                      SizedBox(height: 20),
                      
                      Text(
                        'Artists of language, adjectives and adverbs add vivid details to narratives. Adjectives describe qualities of objects, people, and places (nouns), while adverbs describe verbs, adjectives, and other adverbs. In the phrase "The quick brown fox," the adjective "brown" describes the fox. In the phrase "He runs swiftly," the adverb “swiftly” modifies the verb "runs."  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 144, 225, 239),
                  ),
                  child: Column(

                    children: [
                      Text(
                        '3. Punctuation 📗 ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 2, 61, 138),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PoetsenOne'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      
                      SizedBox(height: 20),
                      
                      Text(
                        'When considering grammar rules, how to use commas and other punctuation marks correctly is a hot topic. Punctuation (like a comma, semicolon, and period) signals when to pause and stop — much like traffic lights — and can steer readers off course when misused. For example, "Lets eat, Grandma" reads much differently than "Lets eat Grandma," and the only difference is a comma.',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(202, 255, 220, 94),
                  ),
                  child: Column(

                    children: [
                      Text(
                        '4. Sentence structure 🗒  ',
                        style: TextStyle(
                          color: Color.fromARGB(227, 34, 27, 3),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PoetsenOne'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      
                      SizedBox(height: 20),
                      
                      Text(
                        'A well-structured sentence is like a well-constructed bridge — it carries the reader from one idea to another. Typical sentence structure is a subject, verb, and object, and following this is an excellent way to increase your writing fluency. For example, "John (subject) scrolls (verb) the smartphone (object)."  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 40),

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(189, 165, 148, 249),
                  ),
                  child: Column(

                    children: [
                      Text(
                        '5. Verb conjugations and tenses   ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 44, 19, 168),
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'PoetsenOne'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      
                      SizedBox(height: 20),
                      
                      Text(
                        'In the English language, verbs conjugate according to tense, such as the present perfect tense. Like placing markers on your narratives timeline, correctly adding verb tense avoids disorienting mistakes that disrupt writings flow and logic. For instance, using "She danced" (past tense) rather than "She dances" for a past event.  ',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Poppins'
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),





              ],
            )
          )
        ],
      ),
    );
  }
}