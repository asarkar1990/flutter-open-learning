import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/standard/standard_selection_screen.dart';

class KnownUserScreen extends StatefulWidget {
  @override
  _KnownUserScreenState createState() => _KnownUserScreenState();
}

class _KnownUserScreenState extends State<KnownUserScreen> {
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return GetBuilder<AuthController>(
      builder: (authServiceRM) => Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: _height / 14,
            ),
            CircleAvatar(
              radius: _width < _height ? _width / 4 : _height / 4,
              backgroundImage: NetworkImage(authServiceRM.user.photoUrl),
            ),
            SizedBox(
              height: _height / 25.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Divider(),
                  ListTile(
                    subtitle: Text('Name'),
                    title: Text(authServiceRM.user.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.lightText)),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person,
                          color: AppTheme.primary,
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text(authServiceRM.user.email,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.lightText)),
                    subtitle: Text('Registered Email Id'),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.mail_outline,
                          color: AppTheme.primary,
                        ),
                      ],
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Class ${authServiceRM.user.standard.title}",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppTheme.primary)),
                    subtitle: Text(
                      '( CBSE Board )',
                    ),
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.school,
                          color: AppTheme.primary,
                        ),
                      ],
                    ),
                    trailing: FloatingActionButton(
                      heroTag: 1,
                      mini: true,
                      onPressed: () {
                        Get.to(StandardSelectionScreen());
                      },
                      child: Icon(
                        Icons.edit,
                        color: AppTheme.primary,
                      ),
                      backgroundColor: AppTheme.white,
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
