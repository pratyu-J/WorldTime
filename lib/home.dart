import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/loading.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  
  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImage = data['isDayTime'] ? 'day.jpg': 'night.jpg';
    Color bgcolor = data['isDayTime'] ? Colors.lightBlueAccent : Colors.black26;

    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage('images/$bgImage'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(onPressed: (){
                  Navigator.pushNamed(context, '/location');
                },
                    icon: Icon(Icons.edit_location,
                    color: Colors.grey[300],),
                    label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                    ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20.0,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 60.0,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
