import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/user_info_screen.dart';
import 'package:shop_app/screens/project_access_key/add_key_screen.dart';
import 'package:shop_app/screens/project_info/student_project_info.dart';
import 'package:shop_app/screens/project_info/student_project_screen.dart';
import 'package:shop_app/screens/sign_in/Authentication.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';
import 'package:shop_app/screens/projects_list/projects_list_screen.dart';

// We use name route
// All our routes will be available here

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  UserInfoScreen.routeName: (context) => UserInfoScreen(user: Authentication.getUser(),),
  ProjectsList.routeName: (context) => ProjectsList(),
  AddKeyScreen.routeName: (context) => AddKeyScreen(),
  StudentProjectScreen.routeName: (context) => StudentProjectScreen(),

};
