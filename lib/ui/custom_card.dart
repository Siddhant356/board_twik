import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class CustomCard extends StatelessWidget {
  final QuerySnapshot snapshot;
  final int index;

  const CustomCard({Key key, this.snapshot, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeToDate = new DateTime.fromMillisecondsSinceEpoch(
        snapshot.documents[index].data["timestamp"].seconds*1000);
    var dateFormatted = new DateFormat("EEEE, d MMM, y").format(timeToDate);
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          child: Card(
            elevation: 9,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text(snapshot.documents[index].data["title"]),
                  subtitle: Text(snapshot.documents[index].data["description"]),
                  leading: CircleAvatar(
                    radius: 34,
                    child: Text(
                        snapshot.documents[index].data["title"].toString()[0]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("By :${snapshot.documents[index].data["name"]} "),
                      Text( dateFormatted),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
