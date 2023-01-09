import 'package:flutter/material.dart';

import 'components/body.dart';

class AddKeyScreen extends StatelessWidget {
  static String routeName = "/project_key";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}