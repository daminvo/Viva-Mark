// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../../models/tabbar_widget.dart';



class StudentProjectInfo extends StatefulWidget {

  @override
  _StudentProjectInfoState createState() => _StudentProjectInfoState();
}

class _StudentProjectInfoState extends State<StudentProjectInfo> {

  @override
  Widget build(BuildContext context) => TabBarWidget(
    title: 'project Informations',
    tabs: [
      Tab(icon: Icon(Icons.group), text: 'Jury members'),
      Tab(icon: Icon(Icons.note_add_sharp), text: 'marks'),
      Tab(icon: Icon(Icons.more_vert), text: 'details'),
    ],
    children: [
      Container(
        child: Column(
          children: [
            Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
              decoration: BoxDecoration(color: Colors.white),
                child: makeListTile("Supervisor", "Amine"),
              ),
            ),
            Card(
              elevation: 8.0,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white),
                child: makeListTile("Examiner", "slkfsjf"),
              ),
            ),

          ],
        )

      ),
      Container(),
      Container(

      ),
    ],
  );


  ListTile makeListTile(String title, String name) => ListTile(
    contentPadding:
    EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    leading: Container(
      padding: EdgeInsets.only(right: 12.0),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.black54))),
      child: Icon(Icons.autorenew, color: Colors.black),
    ),
    title: Text(
        title,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              // tag: 'hero',
              child: LinearProgressIndicator(
                  backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                  value: 0.66,
                  valueColor: AlwaysStoppedAnimation(kPrimaryColor)),
            )),
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(name,
                  style: TextStyle(color: Colors.black))),
        )
      ],
    ),
    trailing:
    Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0),
  );
}

