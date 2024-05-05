import 'package:flutter/material.dart';
import 'package:flutter_application_2/home_page.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  //init the hive
  await Hive.initFlutter();
  //open a box
  var box=await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow
      ),
    );
  }
}

