import 'package:flutter/material.dart';
import 'package:shop_app/screens/drawer/navDrawer.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: NavDrawer(),
      body: Body(),
    );
  }
}
