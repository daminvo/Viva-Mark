import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/screens/project_access_key/add_key_screen.dart';
import 'package:shop_app/screens/sign_in/Authentication.dart';

import 'package:shop_app/components/no_account_text.dart';

//sign in with google
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


import 'package:shop_app/size_config.dart';
import '../../project_access_key/add_key_screen.dart';
import '../../sign_in/google_sign_in_button.dart';
import '../../sign_up/sign_up_screen.dart';
import '../components/splash_content.dart';
import '../../../components/default_button.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Consult your candidate in a minute\n Let’s get started",
      "image": "assets/images/candidate.png"
    },
    {
      "text": "Register the marks easily",
      "image": "assets/images/marks.png"
    },
    {
      "text": "And we help you calculate the viva mark  ",
      "image": "assets/images/calculate.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Text(
              "Viva",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(36),
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
            ),
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: splashData.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashData[index]["image"],
                  text: splashData[index]['text'],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(50)),
                child: Column(
                  children: <Widget>[
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        splashData.length,
                        (index) => buildDot(index: index),
                      ),
                    ),
                    Spacer(flex: 3),
                    GoogleSignInButton(),
                    Text('You do not have an account?'),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 3,
                          height: getProportionateScreenHeight(46),
                          child: TextButton(
                            style: TextButton.styleFrom(
                              shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              primary: Colors.white,
                              backgroundColor: kPrimaryColor,
                            ),
                            onPressed: () => Navigator.pushNamed(context, SignUpScreen.routeName) ,
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SizedBox(
                            width:MediaQuery.of(context).size.width / 3,
                            height: getProportionateScreenHeight(46),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape:
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                primary: Colors.white,
                                backgroundColor: Colors.white,
                              ),
                              onPressed: () => Navigator.pushNamed(context, AddKeyScreen.routeName) ,
                              child: Text(
                                'Add key',
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(18),
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: 25)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


    AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  @override
  void initState(){
    Authentication.initializeFirebase(context: context);
    super.initState();
  }
}

