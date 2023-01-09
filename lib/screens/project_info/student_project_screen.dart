import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/project_info/student_project_info.dart';

class StudentProjectScreen extends StatelessWidget {
  static String routeName = "/project_info";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StudentProjectInfo(),
    );
  }
}