import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "Germany.png", url: "Europe/Berlin");
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime':instance.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      // body: Center(
      //   child: Center(
      //     child:SpinKitRotatingCircle(
      //     color: Colors.white,
      //     size: 80.0,
      //   ),
      //   ),
      // ),
      body: Text(
        "Loading..."
      ),
    );
  }
}
