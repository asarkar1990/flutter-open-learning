import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/widgets/googleSignInButton.dart';

class WelcomeScreen extends StatelessWidget {
  var authService = Get.find<AuthController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 80.0),
                  child: Image.asset(
                    'assets/undraw_choice_9385.png',
                    width: MediaQuery.of(context).size.width / 1.5,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'NCERT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    letterSpacing: 0.0,
                    color: AppTheme.primary,
                  ),
                ),
                Text(
                  'The National Council of Educational Research and Training',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: AppTheme.fontName,
                    letterSpacing: 0.0,
                    color: AppTheme.darkL,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                googleSignInButton(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: ButtonTheme(
                    minWidth: 300.0,
                    height: 50.0,
                    child: FlatButton(
//                      elevation: 8,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      onPressed: () {
                        authService.setState((s) => s.anonymousSignIn());
                      },
                      color: AppTheme.white,
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          fontFamily: AppTheme.fontName,
//                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 0.0,
                          color: AppTheme.grey,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
