import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/bindings/bindings.dart';
import 'package:ncert/homePage/ui/welcome_screen.dart';
import 'package:ncert/myAccount/ui/MyAccountPage.dart';
import 'package:ncert/standard/standard_selection_screen.dart';

import 'auth/auth.dart';
import 'homePage/ui/home_screen.dart';

FirebaseAnalytics analytics = FirebaseAnalytics();

void main() {
  runApp(
    MyApp(),
  );
//  Admob.initialize(admodId);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      home: GetBuilder<AuthController>(
        builder: (auth) {
          if (auth.user == null)
            return WelcomeScreen();
          else if (auth.user.standard == null)
            return StandardSelectionScreen();
          else
            return HomeScreen();
        },
      ),
      routes: {
        MyAccountPage.routeName: (context) => MyAccountPage(),
      },
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
