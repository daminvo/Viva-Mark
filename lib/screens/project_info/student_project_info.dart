// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/ApiResponse.dart';
import 'package:shop_app/services/project_service.dart';

import '../../models/Project.dart';
import '../../models/tabbar_widget.dart';



class StudentProjectInfo extends StatefulWidget {
  @override
  _StudentProjectInfoState createState() => _StudentProjectInfoState();
}

class _StudentProjectInfoState extends State<StudentProjectInfo> {

  Project proj = Project();

  @override
  initState() {
      getProject();
    super.initState();
  }

  void getProject() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    String myKey = pref.getString('projKey')!;

    ApiResponse response = await getProjectByKey(myKey);
    setState(() {
      proj = response.data as Project;
    });
    pref.remove('projKey')!;

    print(response.data);


  }


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
            SizedBox(height: 10,),
            Container(
              color: Colors.transparent,
              padding: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
              child: Container(
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
                child: makeListTile("Supervisor", "${proj.supervisor}"),
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: makeListTile("Examiner", "${proj.examiner}"),
              ),
            ),
            Container(
              color: Colors.transparent,
              padding: new EdgeInsets.symmetric(horizontal: 30.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: makeListTile("President", "${proj.president}"),
              ),
            ),
            SizedBox(height: 110,),
            Text('created by:', style: TextStyle(color: Colors.black87, fontSize: 15),),
            SizedBox(height: 10,),
            Card(
              elevation: 1.0,
              color: Colors.transparent,
              margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                child: makeListTileSt("${proj.firstStudent}"),
              ),
            ),
            (proj.secondStudent == null)
                ? SizedBox(height: 20,)
                : Card(
                    elevation: 1.0,
                    color: Colors.transparent,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: makeListTileSt( "${proj.secondStudent}"),
                    ),
                  ),
            (proj.thirdStudent == null)
                ? SizedBox(height: 20,)
                : Card(
                    elevation: 1.0,
                    color: Colors.transparent,
                    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                      child: makeListTileSt("${proj.thirdStudent}"),
                    ),
                  ),
          ],
        )

      ),



      Container(
        child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text('${proj.vivaMark} / 12', style: TextStyle(color: Colors.black54, fontSize: 60, fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.only(left: 0, top: 40, right: 0, bottom: 40),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                      ),
                      child: Text("Viva mark", style: TextStyle(color: Colors.white, fontSize: 30),),
                      padding: EdgeInsets.only(left: 95, top: 10, right: 95, bottom: 10),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 60,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text('${proj.spMark}', style: TextStyle(color: kSecondaryColor, fontSize: 55, fontWeight: FontWeight.bold)),
                          padding: const EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                          ),
                          child: Text("Supervisor mark", style: TextStyle(color: Colors.white)),
                          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          child: Text('${proj.exMark}', style: TextStyle(color: kSecondaryColor, fontSize: 55, fontWeight: FontWeight.bold)),
                          padding: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 5),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                          ),
                          child: Text("Examiner mark", style: TextStyle(color: Colors.white),),
                          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                        ),

                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20,),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Container(
                      child: Text('${proj.prMark}', style: TextStyle(color: kTextColor, fontSize: 55, fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.only(left: 60, top: 5, right: 60, bottom: 5),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                      ),
                      child: Text("President mark", style: TextStyle(color: Colors.white),),
                      padding: EdgeInsets.only(left: 60, top: 10, right: 60, bottom: 10),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 20,),
            ],
          ),
      ),



      Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Project Name:', style: TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    child: Center(
                      child: Text('${proj.name}', style: TextStyle(color: kTextColor, fontSize: 25, fontWeight: FontWeight.bold)),
                    ),
                    decoration: new BoxDecoration(
                        border: new Border(
                            bottom: new BorderSide(width: 1.0, color: Colors.black54))
                    ),
                    padding: EdgeInsets.only(bottom: 20),
                  ),
                  SizedBox(height: 40,),
                  Text('Year:', style: TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    child: Center(
                      child: Center(
                        child: Text('${proj.year}', style: TextStyle(color: kTextColor, fontSize: 25, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    decoration: new BoxDecoration(
                        border: new Border(
                            bottom: new BorderSide(width: 1.0, color: Colors.black54))
                    ),
                    padding: EdgeInsets.only(bottom: 30),
                  ),
                  SizedBox(height: 40,),
                  Text('Key:', style: TextStyle(color: Colors.black87, fontSize: 25, fontWeight: FontWeight.bold)),
                  Container(
                    child: Center(
                      child: Center(
                        child: Center(
                          child: Text('${proj.key}', style: TextStyle(color: kTextColor, fontSize: 25, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    decoration: new BoxDecoration(
                        border: new Border(
                            bottom: new BorderSide(width: 1.0, color: Colors.black54))
                    ),
                    padding: EdgeInsets.only(bottom: 30),
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 30, top: 10, right: 60, bottom: 10),
            ),
    ],
  );


  ListTile makeListTile(String title, String name) => ListTile(
    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
    leading: Container(
      padding: EdgeInsets.only(right: 15.0, top: 10,  bottom: 10),
      decoration: new BoxDecoration(
          border: new Border(
              right: new BorderSide(width: 1.0, color: Colors.black54))),
      child: Icon(Icons.person, color: kPrimaryColor,),
    ),
    title: Center(
      child: Padding(
          padding: EdgeInsets.only(right: 50.0),
          child: Text(
            title,
            style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
          )),
    ),
    // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

    subtitle: Row(
      children: <Widget>[
          Icon(Icons.circle, size: 8, color: Colors.black,),
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Text(name,
                  style: TextStyle(color: Colors.black))),
        )
      ],
    ),
  );


  SizedBox makeListTileSt( String name) => SizedBox(
    height: 40,
      child: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Row(
            children: <Widget>[
              Icon(Icons.arrow_forward_ios, size: 15, color: kPrimaryColor,),
              Text(name,
                  style: TextStyle(color: Colors.black))

            ],
          ),
      ),
    );

}

