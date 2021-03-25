import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'id_card_data.dart';


class CardTemplate extends StatelessWidget {
  final IDCardData person;
  final Function delete;
  CardTemplate({this.person, this.delete });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.cyan,
      margin: EdgeInsets.all(10.0),
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(person.name,
            style: TextStyle(
            fontStyle: FontStyle.italic,
              fontSize: 20.0,
              color: Colors.deepOrange,
            ),
            ),
            SizedBox(height: 20.0),
            Text(person.id,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 20.0),
            Text(person.email,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 20.0,
                color: Colors.deepOrange,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton.icon(
                    onPressed: delete,
                    icon: Icon(Icons.delete),
                    label: Text('Delete ID'),

                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
