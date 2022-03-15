import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/Home/admin_home_screen.dart';
import 'package:flutter_auth/Screens/Signup/signup_screen.dart';
import 'package:flutter_auth/Screens/User/Home/home_screen.dart';
import 'package:flutter_auth/public_components/already_have_an_account_acheck.dart';
import 'package:flutter_auth/public_components/rounded_button.dart';
import 'package:page_transition/page_transition.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(30, 200, 30, 0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AlreadyHaveAnAccountCheck(
            login: true,
            press: () {
              Get.to(() => SignUpScreen());
            },
          ),
          RoundedButton(
            text: "MASUK",
            press: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      duration: Duration(milliseconds: 300),
                      reverseDuration: Duration(milliseconds: 300),
                      child: HomePage()));
            },
          ),
          InkWell(
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AdminHomeScreen(),
                ),
              );
            },
            child: Text('Admin Login (alpha tester)',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Poppins',
                    fontSize: 10)),
          )
        ],
      ),
    );
  }
}
