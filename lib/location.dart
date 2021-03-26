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
    WorldTime(url: 'Europe/London', location: 'London', flag: 'avatar.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'avatar.jpg'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'avatar.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'avatar.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'avatar.jpg'),
    WorldTime(url: 'America/NewYork', location: 'NewYork', flag: 'avatar.jpg'),
  ];
  
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
                print(locations[index].location);
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
