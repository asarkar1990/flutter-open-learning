import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/myAccount/ui/knownUserScreen.dart';

import 'anonymousUserScreen.dart';

class MyAccountPage extends StatelessWidget {
  static const String routeName = "/myAccountPage";

  final AuthController authService = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: AppTheme.primary,
        title: Text("My Account"),
      ),
      body: authService.user.isAnonymous
          ? AnonymousUserScreen()
          : KnownUserScreen(),
    );
  }
}
