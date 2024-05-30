import 'package:flutter/material.dart';
import 'package:learnit/utility/api_wordresponse.dart';
import 'package:learnit/utility/savedwords.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:convert';

class Vocabulary extends StatefulWidget {
  const Vocabulary({super.key});

  @override
  State<Vocabulary> createState() => _VocabularyState();
}

class _VocabularyState extends State<Vocabulary> {

  final apiwordresponse = Apiwordresponse();
  final FlutterTts flutterTts = FlutterTts();

  String _randomWord = '';
  String _word = 'example';
  
  List<dynamic>? _synonyms;
  List<dynamic>? _antonyms;
  List<dynamic>? _definitions;
  bool _isLoading = false;

  TextEditingController _searchController = TextEditingController();
  
  void _speak() async {
    await flutterTts.speak(_word);
  }

  Future<void> _fetchRandomWord() async {
    final String apiUrl = 'https://random-word-api.herokuapp.com/word';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        setState(() {
          _randomWord = jsonResponse[0];
          fetchWordData();
        });
      } else {
        throw Exception('Failed to load random word');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  void fetchWordData() async {
    setState(() {
      _isLoading = true;
    });
    _synonyms = await apiwordresponse.fetchSynonyms(_randomWord);
    _antonyms = await apiwordresponse.fetchAntonyms(_randomWord);
    _definitions = await apiwordresponse.fetchDefinitions(_randomWord);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchRandomWord();
    
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Consumer<Savedwords>(
      builder: (context, vocab, child) {
        return Scaffold(
          backgroundColor: Color.fromARGB(47, 104, 74, 239),
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
                        'Please the word to search',

                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 28,
                          fontFamily: 'PoetsenOne'
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 5, bottom: 20),
                            width: size.width,
                            height: 60,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                          
                            child: TextFormField(

                              controller: _searchController,
                          
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                          
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter word to search ...',
                                contentPadding: EdgeInsets.only(left: 25)
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 60,
                          width: 60,
                          margin: EdgeInsets.only(bottom: 15),
                          alignment: Alignment.center,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white
                          ),
                          child: IconButton(
                            onPressed: (){
                              setState(() {
                                _randomWord = _searchController.text;
                                fetchWordData();
                              });
                            },
                          
                            icon: Icon(
                              Icons.search,
                              size: 30,
                              ),
                          ),
                        )
                      ],
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
                  color: Color.fromARGB(57, 104, 74, 239)
                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Text(
                      'Word of the Day',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 35,
                      ),
                    ),

                    Text(
                      _randomWord,

                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF674AEF),
                        fontWeight: FontWeight.w600
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                      
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: ElevatedButton(

                              onPressed: (){
                                vocab.add(_randomWord);
                                setState(() {
                                  
                                });
                                final snackBar = SnackBar(
                                  content: Text('Word Saved'),
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                );

                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              },

                              child: Text(
                                'Save Word',
                                style: TextStyle(fontSize: 20, color: Colors.white),
                              ),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF674AEF)),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>
                                (
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              
                            ),
                          ),
                        ],
                      ),
                    ),

                    Divider(height: 10, color: Colors.black),

                    _isLoading
                    ? Center(child: CircularProgressIndicator())
                    :
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      
                      child: Column(
                        children: [
                            SizedBox(height: 16),

                            _definitions != null && _definitions!.isNotEmpty

                              ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Definition',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 35,
                                    ),
                                  ),
                                  
                                  Text(
                                    
                                    _definitions![0]['defs'][0],
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                    textAlign: TextAlign.justify,
                                  )
                                ],
                              )
                              : Container(),

                            SizedBox(height: 16),  

                            _synonyms != null && _synonyms!.isNotEmpty

                              ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Synonymns',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 35,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  
                                  Text(
                                    _synonyms!.map((e) => e['word']).join(', '),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              )
                              : Container(),

                            SizedBox(height: 16),

                            _synonyms != null && _synonyms!.isNotEmpty

                              ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Antonyms',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 35,
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  
                                  Text(
                                    _antonyms!.map((e) => e['word']).join(', '),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              )
                              : Container(),

                            SizedBox(height: 16),

                        ]
                      ),
                    )

                  ],
                ),
              )

            ],
          ),
        );
      },
    );
  }
}