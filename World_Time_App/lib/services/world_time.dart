//import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
   String location; //location name for ui
  late String time; //the time in that location
   String flag; //url to an asset flag icon
   String url; //location url for api endpoints
   late bool isDayTime; //true or false if daytime or not

  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{
    //make the request
    Response response=await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
    Map data=jsonDecode(response.body);
    

    //get properties from data
    String datetime=data['utc_datetime'];
    String offset=data['utc_offset'].substring(1,3);

    //create DateTime object
    DateTime now=DateTime.parse(datetime);
    now=now.add(Duration(hours: int.parse(offset)));
   
    //set the time property
    isDayTime = now.hour>6 && now.hour<20 ? true:false;
    time=DateFormat.jm().format(now);
    //time=now.toString();
   
  }


}

WorldTime instance=WorldTime(
  location: "Berlin", 
  flag: "Germany.png", 
  url: "Europe/Berlin"
  );
  