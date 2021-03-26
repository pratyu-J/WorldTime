import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});


  Future<void> getTime() async{

    http.Response response = await http.get("https://worldtimeapi.org/api/timezone/$url");
    Map data = jsonDecode(response.body);

    String dateTime = data['datetime'];
    String hrs = data['utc_offset'].substring(1,3);
    String min = data['utc_offset'].substring(4,6);
    DateTime now = DateTime.parse(dateTime);
    now  = now.add(Duration(hours: int.parse(hrs), minutes: int.parse(min)));

    isDaytime = now.hour > 6 && now.hour < 20? true : false;
    print(isDaytime);
    time = DateFormat.jm().format(now);
  }

}