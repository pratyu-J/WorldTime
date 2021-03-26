import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();

}

class _LoadingState extends State<Loading> {

  String time = "loading";

  void setupWorldTime() async{
    WorldTime worldTime = WorldTime(location: 'Kolkata', flag: 'avatar.jpg', url: 'Asia/Kolkata');
    await worldTime.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDaytime,
    });
   // print(worldTime.time);

    /*setState(() {
      time = worldTime.time;
    });*/
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
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        title: Text('Loading',
        ),
      ),
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
