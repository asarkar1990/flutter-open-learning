import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/standard/standard_selection_screen.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class OtpScreen extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  AuthController authService = Get.find<AuthController>();

  final TextEditingController _smsController = TextEditingController();

  String _message = '';
  String _verificationId;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: authService.auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialButton(
            onPressed: () => authService.signOut(),
            color: Colors.red,
            textColor: Colors.white,
            child: Text('Signout'),
          );
        } else {
          return Scaffold(
            resizeToAvoidBottomPadding: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: AppTheme.white,
              iconTheme: IconThemeData(
                color: AppTheme.primary,
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image.asset(
                      'assets/undraw_mobile_login_ikmv.png',
                      width: MediaQuery.of(context).size.width / 1.5,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(width: 40),
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Please enter the ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                        TextSpan(
                            text: 'One Time Password',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: ' sent to your mobile number',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400)),
                      ])),
                    ),
                    SizedBox(width: 20),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: <Widget>[
                    PinEntryTextField(
                      fields: 6,
//                      showFieldAsBox: true,
                      onSubmit: (String pin) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text("Pin"),
                                content: Text('Pin entered is $pin'),
                              );
                            }); //end showDialog()
                      }, // end onSubmit
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: ButtonTheme(
                        minWidth: 300.0,
                        height: 50.0,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                          onPressed: () async {},
                          color: AppTheme.primary,
                          child: Text("Resend OTP",
                              style: TextStyle(
                                fontFamily: AppTheme.fontName,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 0.0,
                                color: AppTheme.white,
                              )),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        _message,
                        style: TextStyle(
                            color: Colors.white, backgroundColor: Colors.red),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StandardSelectionScreen(),
                          ),
                        );
                      },
                      textColor: Colors.white,
                      color: Colors.orange,
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                      child: Text(
                        "dummy for go next page",
                      ),
                    ),
                  ],
                ),
              ],
            ),
//            body: Stack(
//              children: <Widget>[
//                Background(),
//                PhoneSignInSection(),
//              ],
//            ),
          );
        }
      },
    );
  }

  // Example code of how to sign in with phone.
  void _signInWithPhoneNumber() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _message = 'Successfully signed in, uid: ' + user.uid;
      } else {
        _message = 'Sign in failed';
      }
    });
  }
}
