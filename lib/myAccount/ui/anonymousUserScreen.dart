import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/standard/standard_selection_screen.dart';
import 'package:ncert/widgets/googleSignInButton.dart';

class AnonymousUserScreen extends StatelessWidget {
  Widget build(BuildContext context) {
//    ReactiveModel<AuthService> authService =
//        Injector.getAsReactive<AuthService>(context: context);
    final _formKey = GlobalKey<FormState>();
    final snackBar = SnackBar(
      content: Text('Class updated.'),
    );
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    final String dummyImgUrl = 'assets/KID1.png';

    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: _height / 14,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Image.asset(
              'assets/undraw_files_6b3d.png',
              width: MediaQuery.of(context).size.width / 1.8,
            ),
          ),
          SizedBox(
            height: _height / 25.0,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Divider(),
                GetBuilder<AuthController>(
                  builder: (authServiceRM) => ListTile(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    StandardSelectionScreen()));
                      },
                      child: Icon(
                        Icons.edit,
                        color: AppTheme.primary,
                      ),
                      backgroundColor: AppTheme.white,
                    ),
                  ),
                ),
                Divider(),
              ],
            ),
          ),
          Divider(
            height: _height / 15,
            color: Colors.white,
          ),
          anonymousToGoogleSignInButton()
          /*GoogleSignInButton(
              onPressed: () {
                authService.setState((s) => s.anonymousToGoogle());
              },
              text: 'Sign In with Google',
              darkMode: true),*/
        ],
      ),
    );
  }
}
