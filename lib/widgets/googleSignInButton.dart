import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';

Widget googleSignInButton() {
  return ButtonTheme(
    minWidth: 300.0,
    height: 50.0,
    child: GetBuilder<AuthController>(
      builder: (authServiceRM) => OutlineButton(
        splashColor: Colors.grey,
        onPressed: () {
          authServiceRM.setState((s) => s.googleSignIn());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        highlightElevation: 0,
        borderSide: BorderSide(color: AppTheme.primary),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppTheme.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget anonymousToGoogleSignInButton() {
  return ButtonTheme(
    minWidth: 300.0,
    height: 50.0,
    child: GetBuilder<AuthController>(
      builder: (authServiceRM) => OutlineButton(
        splashColor: Colors.grey,
        onPressed: () {
          authServiceRM.setState((s) => s.anonymousToGoogle());
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        highlightElevation: 0,
        borderSide: BorderSide(color: AppTheme.primary),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage("assets/google_logo.png"), height: 25.0),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sign in with Google',
                  style: TextStyle(
                    fontSize: 20,
                    color: AppTheme.primary,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
