import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/world_time.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();

}

class Address {
  final String time;
  final String date;

  Address({
    this.time,
    this.date
  });

  factory Address.fromJson(Map<String, dynamic> parsedJson) {

    return new Address(
      time: parsedJson['timezone'],
      date: parsedJson['week_number'],
    );
  }
}


class _LoadingState extends State<Loading> {

  String time = "loading";

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(location: 'Berlin', flag: 'avatar.jpg', url: 'Asia/Kolkata');
    await worldTime.getTime();
    print(worldTime.time);

    setState(() {
      time = worldTime.time;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading',
        style: TextStyle(
        ),
        ),
      ),
      body: Center(
        child: Text(
          time,
          style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
        ),
      )
    );
  }
}
