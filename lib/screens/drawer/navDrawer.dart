import 'package:flutter/material.dart';
import 'package:shop_app/screens/sign_in/Authentication.dart';

import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/services/user_service.dart';
import '../home/components/form.dart';
import 'package:shop_app/screens/projects_list/projects_list_screen.dart';

class NavDrawer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child :Column(
          children:<Widget> [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.blueAccent,
              child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin: EdgeInsets.only(top: 30,),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('assets/images/teacher.png'),
                              fit: BoxFit.fill),
                        ),
                      ),
                      Text('nom et prenom ',style: TextStyle(fontSize: 22,color: Colors.white,),),
                      Text('nomprenom@gmail.com ',style: TextStyle(color: Colors.white,),)
                    ],
                  )

              ),
            ) ,
            ListTile(
                leading: Icon(Icons.add),
                title: Text(
                  'new project',
                  style: TextStyle(fontSize: 18,),
                ),

                onTap: (){
                  Navigator.pushNamed(context, Home.routeName);}
            ),
            ListTile(
                leading: Icon(Icons.list_alt_outlined),
                title: Text(
                  'projects list',
                  style: TextStyle(fontSize: 18,),
                ),

                onTap: (){
                  Navigator.pushNamed(context, ProjectsList.routeName);}
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'logout',
                style: TextStyle(fontSize: 18,),
              ),
              onTap: (){
                userLogout();
                Authentication.signOut(context: context);
                Navigator.pushNamed(context, SplashScreen.routeName);
              },
            )
          ]
      ),
    );
  }
}