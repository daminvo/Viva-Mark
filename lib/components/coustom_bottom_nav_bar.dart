import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/user_info_screen.dart';

import '../constants.dart';
import '../enums.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;

    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      width: size.width,
      height: 50,
      color: Color(0xffff00ff).withOpacity(0),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/projects.svg",
                    color: MenuState.home == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(context, HomeScreen.routeName),
                ),

                SizedBox(),

                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: MenuState.profile == selectedMenu
                        ? kPrimaryColor
                        : inActiveIconColor,
                  ),
                  onPressed: () =>
                      Navigator.pushNamed(
                          context, UserInfoScreen.routeName),
                ),
              ],
            )
    );
  }
}




