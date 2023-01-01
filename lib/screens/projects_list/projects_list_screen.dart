import 'package:flutter/material.dart';
import 'package:shop_app/screens/drawer/navDrawer.dart';
import 'package:shop_app/screens/projects_list/components/body.dart';

import '../../constants.dart';
import '../../size_config.dart';

class ProjectsList extends StatelessWidget {
  static String routeName = "/ProjectsList";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Container(
            width: SizeConfig.screenWidth * 0.7,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextField(
              onChanged: (value) => print(value),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenWidth(9)),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search project",
                  prefixIcon: Icon(Icons.search)),
            ),
          )
      ),
      drawer: NavDrawer(),
      body: Body(),
    );
  }
}
