import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/home.dart';
import 'package:world_time_app/pages/loading.dart';
//import 'package:http/http.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context)=>const Loading(),
      '/home':(context)=>const Home(),
      '/location':(context)=>const ChooseLocation()
    },
  ));
}

