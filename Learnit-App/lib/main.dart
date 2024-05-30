import 'package:flutter/material.dart';
import 'package:learnit/pages/get_started.dart';
import 'package:learnit/pages/grammar.dart';
import 'package:learnit/pages/main_page.dart';
import 'package:learnit/pages/saveduser.dart';
import 'package:learnit/pages/vocabulary.dart';
import 'package:learnit/utility/savedwords.dart';
import 'package:learnit/utility/userinfo.dart';
import 'package:learnit/utility/vocabularyprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Userinfo()),
        ChangeNotifierProvider(create: (context) => Savedwords()),
        ChangeNotifierProvider(create: (context) => VocabularyProvider())
      ],
      child: MaterialApp(
        title: 'Learn It',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        home: GetStarted(),
        // home: Grammar(),
      ),
    );
  }
}

