import 'package:flutter/material.dart';
import 'discount_banner.dart';
import 'form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DiscountBanner(),
            // SizedBox(height: getProportionateScreenWidth(30)),
            Home(),
          ],
        ),
      ),
    );
  }
}
