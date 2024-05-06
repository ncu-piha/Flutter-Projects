import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations=[
    WorldTime(location: 'London', flag: 'uk.png', url: 'Europe/London'),
     WorldTime(location: 'Athens', flag: 'greece.png', url: 'Europe/Berlin'),
      WorldTime(location: 'Cairo', flag: 'egypt.png', url: 'Africa/Cairo'),
      WorldTime(location: 'Nairobi', flag: 'kenya.png', url: 'Africa/Nairobi'),
      WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata'),
      

  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();

    //navigate to home screen
    Navigator.pop(context,{
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime':instance.isDayTime
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                  
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage("assets/${locations[index].flag}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}