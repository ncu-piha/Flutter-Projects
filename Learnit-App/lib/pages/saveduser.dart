import 'package:flutter/material.dart';
import 'package:learnit/utility/savedwords.dart';
import 'package:provider/provider.dart';

class Saveduser extends StatefulWidget {
  const Saveduser({super.key});

  @override
  State<Saveduser> createState() => _SaveduserState();
}

class _SaveduserState extends State<Saveduser> {

  @override
  Widget build(BuildContext context) {
    return Consumer<Savedwords>(
      builder: (context, savedWords, child) {
        return Scaffold(
          body: ListView(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: 15, bottom: 10, left: 15, right: 15),
                decoration: BoxDecoration(
                    color: Color(0xFF674AEF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
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
                        'Saved Words',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 28,
                            fontFamily: 'PoetsenOne'),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(57, 104, 74, 239)),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6, 
                  child: ListView.builder(
                    itemCount: savedWords.words.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('${index + 1}. ${savedWords.words[index]}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
