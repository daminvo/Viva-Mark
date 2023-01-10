import 'package:flutter/material.dart';
import 'package:shop_app/models/ApiResponse.dart';
import 'package:shop_app/models/User.dart';
import 'package:shop_app/screens/sign_in/Authentication.dart';

import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/services/user_service.dart';
import '../../constants.dart';
import '../../enums.dart';
import '../home/components/form.dart';
import 'package:shop_app/screens/projects_list/projects_list_screen.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer(MenuState this.selectedPage, {Key? key}) : super(key: key);

  final MenuState selectedPage;

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}



class _NavDrawerState extends State<NavDrawer> {
  User user = User();

  void userInfo() async {
    ApiResponse response = await getUserInfo();
    setState(() {
      user = response.data as User;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.lightBlue[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(children: <Widget>[
        SizedBox(height: 30),
        Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(
                    top: 30,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage('assets/images/teacher.png'),
                        fit: BoxFit.fill),
                  ),
                ),
                Text(
                  '${user?.firstName} ${user?.familyName}',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                ),
                Text(
                  '${user?.email}',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                )
              ],
            )),
        SizedBox(height: 40),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10),
          color: MenuState.newViva == widget.selectedPage
            ? Colors.white
            : Colors.blueGrey[100],
          shape: RoundedRectangleBorder(
            borderRadius: MenuState.newViva == widget.selectedPage
                ? BorderRadius.circular(10)
                : BorderRadius.circular(20),
          ),
          child: ListTile(
              leading: Icon(
                Icons.add,
                color: MenuState.newViva == widget.selectedPage
                    ? kPrimaryColor
                    : Colors.grey,
              ),
              title: Text(
                'new project',
                style: TextStyle(
                  color: MenuState.newViva == widget.selectedPage
                      ? kPrimaryColor
                      : Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, Home.routeName);
              }),
        ),
        SizedBox(height: 10),
        Card(
          margin: EdgeInsets.only(left: 10, right: 10),
          color: MenuState.projectsList == widget.selectedPage
              ? Colors.white
              : Colors.blueGrey[100],
          shape: RoundedRectangleBorder(
            borderRadius: MenuState.projectsList == widget.selectedPage
                ? BorderRadius.circular(10)
                : BorderRadius.circular(20),
          ),
          child: ListTile(
              leading: Icon(
                Icons.list_alt_outlined,
                color: MenuState.projectsList == widget.selectedPage
                    ? kPrimaryColor
                    : Colors.black,
              ),
              title: Text(
                'projects list',
                style: TextStyle(
                  color: MenuState.projectsList == widget.selectedPage
                      ? kPrimaryColor
                      : Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, ProjectsList.routeName);
              }),
        ),
        SizedBox(height: 10),
        Card(
            margin: EdgeInsets.only(left: 10, right: 10),
            color: Colors.blueGrey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'logout',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                userLogout();
                Authentication.signOut(context: context);
                Navigator.pushNamed(context, SplashScreen.routeName);
              },
            ))
      ]),
    );
  }

  @override
  void initState() {
    userInfo();
    super.initState();
  }
}

//
// class NavDrawer extends StatelessWidget{
//
//   User user = User();
//
//   void userInfo() async {
//     ApiResponse response = await getUserInfo().then((value) {user = value.data as User;
//     return value;});
//     print(user);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     onInit: () {
//       userInfo();
//     };
//
//
//     return Drawer(
//       child :Column(
//           children:<Widget> [
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(20),
//               color: Colors.blueAccent,
//               child: Center(
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         width: 100,
//                         height: 100,
//                         margin: EdgeInsets.only(top: 30,),
//                         decoration: BoxDecoration(
//                           shape: BoxShape.circle,
//                           image: DecorationImage(image: AssetImage('assets/images/teacher.png'),
//                               fit: BoxFit.fill),
//                         ),
//                       ),
//                       Text('${user?.firstName } ${user?.familyName}',style: TextStyle(fontSize: 22,color: Colors.white,),),
//                       Text('${user?.email}',style: TextStyle(color: Colors.white,),)
//                     ],
//                   )
//
//               ),
//             ) ,
//             ListTile(
//                 leading: Icon(Icons.add),
//                 title: Text(
//                   'new project',
//                   style: TextStyle(fontSize: 18,),
//                 ),
//
//                 onTap: (){
//                   Navigator.pushNamed(context, Home.routeName);}
//             ),
//             ListTile(
//                 leading: Icon(Icons.list_alt_outlined),
//                 title: Text(
//                   'projects list',
//                   style: TextStyle(fontSize: 18,),
//                 ),
//
//                 onTap: (){
//                   Navigator.pushNamed(context, ProjectsList.routeName);}
//             ),
//             ListTile(
//               leading: Icon(Icons.logout),
//               title: Text(
//                 'logout',
//                 style: TextStyle(fontSize: 18,),
//               ),
//               onTap: (){
//                 userLogout();
//                 Authentication.signOut(context: context);
//                 Navigator.pushNamed(context, SplashScreen.routeName);
//               },
//             )
//           ]
//       ),
//     );
//   }

// }
