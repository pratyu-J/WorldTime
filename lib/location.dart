import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/card_template.dart';
import 'package:flutter_app/services/world_time.dart';


class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'england.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'berlin.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'avatar.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'avatar.jpg'),
    WorldTime(url: 'Africa/Abidjan', location: 'Abidjan', flag: 'avatar.jpg'),
    WorldTime(url: 'Africa/Casablanca', location: 'Casablanca', flag: 'avatar.jpg'),
    WorldTime(url: 'Africa/Tripoli', location: 'Tripoli', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Argentina/Buenos_Aires', location: 'Buenos_Aires', flag: 'argentina.jpg'),
    WorldTime(url: 'America/Barbados', location: 'Barbados', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Costa_Rica', location: 'Costa_Rica', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Denver', location: 'Denver', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Detroit', location: 'Detroit', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Los_Angeles', location: 'Los_Angeles', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Mexico_City', location: 'Mexico_City', flag: 'avatar.jpg'),
    WorldTime(url: 'America/New_York', location: 'New_York', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Toronto', location: 'Toronto', flag: 'avatar.jpg'),
    WorldTime(url: 'Asia/Baghdad', location: 'Baghdad', flag: 'avatar.jpg'),
    WorldTime(url: 'Asia/Beirut', location: 'Beirut', flag: 'avatar.jpg'),
    WorldTime(url: 'Asia/Bangkok', location: 'Bangkok', flag: 'avatar.jpg'),
    WorldTime(url: 'Asia/Kolkata', location: 'Kolkata', flag: 'india.jpg'),
    WorldTime(url: 'Asia/Kuala_Lumpur', location: 'Kuala_Lumpur', flag: 'avatar.jpg'),
    WorldTime(url: 'Asia/Qatar', location: 'Qatar', flag: 'avatar.jpg'),
    WorldTime(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldTime(url: 'Australia/Adelaide', location: 'Adelaide', flag: 'australia.jpg'),
    WorldTime(url: 'Australia/Brisbane', location: 'Brisbane', flag: 'australia.jpg'),
    WorldTime(url: 'Australia/Sydney', location: 'Sydney', flag: 'australia.jpg'),
  ];

  void TimeUpdate(index) async{
    WorldTime worldTime = locations[index];

    await worldTime.getTime();

    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDaytime,
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location',
          style: TextStyle(
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: locations.length,
          itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                TimeUpdate(index);
                //print(locations[index].location);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/${locations[index].flag}'),
              ),
            ),

          );
          },
      ),
    );
  }
}
