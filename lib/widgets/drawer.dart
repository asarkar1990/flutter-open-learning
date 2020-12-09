import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/myAccount/ui/MyAccountPage.dart';
import 'package:package_info/package_info.dart';
import 'package:share/share.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return buildDrawer(context);
  }

  Future<String> appVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String version = packageInfo.version;

    return version;
  }

  buildDrawer([BuildContext context]) {
    return Drawer(
      elevation: 10.0,
      child: Column(
        children: [
          buildDrawerHeader(context),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.face,
              color: AppTheme.nearlyBlue,
            ),
            title: Text(
              'My Account',
              style: TextStyle(fontSize: 16, color: AppTheme.lightText),
            ),
            subtitle: Text('Edit or view profile details'),
            onTap: () {
              Get.toNamed(MyAccountPage.routeName);
            },
          ),
          buildSignInSignout(),
          Spacer(),
          Divider(
            color: Colors.amber,
            height: 1.0,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.mobile_screen_share,
              color: AppTheme.greenBtn,
            ),
            title: Text(
              'Share the App',
              style: TextStyle(fontSize: 16, color: AppTheme.lightText),
            ),
            subtitle: Text('Help to Your Friends'),
            onTap: () async {
              Share.share(
                'I am having a great time with NCERT Books & NCERT Solutions.\nDownload this app for NCERT Books, NCERT Solutions, Reference Solutions, Sample papers etc.\n\nhttps://thestudypath.page.link/app',
              );
            },
          ),
          ListTile(
            dense: true,
            leading: Icon(Icons.rate_review, color: Colors.amber),
            title: Text(
              'Review',
              style: TextStyle(fontSize: 16, color: AppTheme.lightText),
            ),
            subtitle: Text('Rate Us'),
            onTap: () {
              LaunchReview.launch(
                androidAppId: "com.thestudypath.ncert",
              );
            },
          ),
          FutureBuilder(
            future: appVersion(),
            builder: (context, data) {
              return ListTile(
                dense: true,
                enabled: false,
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.blue,
                ),
                title: Text(
                  "${data.data}",
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                subtitle: Text('Version of this App'),
              );
            },
          ),
          Divider(
            color: Colors.amber,
            height: 1.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "powered by",
                      style: TextStyle(color: Colors.black38, fontSize: 10.0),
                    ),
                    Image(
                      width: 100.0,
                      image: ExactAssetImage('assets/logo.png'),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildDrawerHeader([BuildContext context]) {
    return GetBuilder<AuthController>(builder: (authServiceRM) {
      if (authServiceRM.user != null && !authServiceRM.user.isAnonymous) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 170.0,
          child: DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/background.jpeg'))),
            margin: EdgeInsets.only(bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage:
                      NetworkImage(authServiceRM.user.photoUrl),
                  radius: 30.0,
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
                Text(
                  authServiceRM.user.name,
                  style: TextStyle(color: Colors.white),
                ),
                Padding(padding: const EdgeInsets.symmetric(vertical: 2.0)),
                Text(
                  authServiceRM.user.email,
                  style: TextStyle(color: Colors.white70),
                )
              ],
            ),
          ),
        );
      } else {
        return DrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/background.jpeg'))),
          padding: EdgeInsets.fromLTRB(15.0, 15.0, 0, 0),
          margin: EdgeInsets.only(bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: AssetImage('assets/dummy_user.png'),
                radius: 30.0,
                backgroundColor: AppTheme.white,
              ),
              ListTile(
                onTap: () {},
                contentPadding: EdgeInsets.only(left: 0, top: 0),
                dense: true,
                title: Text(
                  "NCERT Student",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                subtitle: Text(
                  '',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              )
            ],
          ),
        );
      }
    });
  }

  buildSignInSignout() {
    return GetBuilder<AuthController>(
      builder: (authServiceRM) {
        if (authServiceRM.user.isAnonymous)
          return ListTile(
            dense: true,
            leading: Image(
                image: AssetImage("assets/google_logo.png"), height: 24.0),
            title: Text(
              'Sign in',
              style: TextStyle(fontSize: 16, color: AppTheme.lightText),
            ),
            subtitle: Text('Continue in with Google'),
            onTap: () {
              authServiceRM.setState((s) => s.anonymousToGoogle());
            },
          );
        else
          return ListTile(
            dense: true,
            leading: Icon(
              Icons.power_settings_new,
              color: Colors.red,
            ),
            title: Text(
              'Logout',
              style: TextStyle(fontSize: 16, color: AppTheme.lightText),
            ),
            subtitle: Text('Log out from this App'),
            onTap: () {
              authServiceRM.setState((s) => s.signOut());
            },
          );
      },
    );
  }
}
