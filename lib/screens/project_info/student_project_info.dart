// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          child: Card(
            child: Container(
              child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                        border: new Border(
                            right: new BorderSide(width: 1.0, color: Colors.grey))),
                    child: Icon(Icons.supervisor_account_outlined, color: Colors.black),
                  ),
                  title: Text(
                    "Supervisor",
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: Colors.black),
                      Text(" Intermediate", style: TextStyle(color: Colors.black))
                    ],
                  ),
                  trailing:
                  Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0)
              ),
            ),
          )
      ),
      Container(),
      Container(

      ),
    ],
  );

  // final makeListTile = ListTile(
  //     contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  //     leading: Container(
  //       padding: EdgeInsets.only(right: 12.0),
  //       decoration: new BoxDecoration(
  //           border: new Border(
  //               right: new BorderSide(width: 1.0, color: Colors.white24))),
  //       child: Icon(Icons.autorenew, color: Colors.white),
  //     ),
  //     title: Text(
  //       "Introduction to Driving",
  //       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  //     ),
  //     // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
  //
  //     subtitle: Row(
  //       children: <Widget>[
  //         Icon(Icons.linear_scale, color: Colors.yellowAccent),
  //         Text(" Intermediate", style: TextStyle(color: Colors.white))
  //       ],
  //     ),
  //     trailing:
  //     Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0)
  // );

}

//
// Card makeCard(Lesson lesson) => Card(
//   elevation: 8.0,
//   margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
//   child: Container(
//     decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
//     child: makeListTile(lesson),
//   ),
// );

// final makeBody = Container(
//   // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
//   child: ListView.builder(
//     scrollDirection: Axis.vertical,
//     shrinkWrap: true,
//     itemCount: lessons.length,
//     itemBuilder: (BuildContext context, int index) {
//       return makeCard(lessons[index]);
//     },
//   ),
// );

