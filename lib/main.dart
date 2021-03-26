
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/loading.dart';
import 'package:flutter_app/location.dart';
import 'id_card_data.dart';
import 'card_template.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location' : (context) => Location(),
    },
  ));
}


