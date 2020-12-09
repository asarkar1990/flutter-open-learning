import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/auth/ui/otp_screen.dart';
import 'package:ncert/css/appTheme.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneNumberController = TextEditingController();
  AuthController authService = Get.find<AuthController>();

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
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Image.asset(
                        'assets/undraw_authentication_fsn5.png',
                        width: MediaQuery.of(context).size.width / 1.5,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        controller: _phoneNumberController,
                        decoration: InputDecoration(
                            prefixText: '+91 ',
                            labelText: 'Enter Your Mobile Number',
                            labelStyle: TextStyle(
                              color: Colors.black54,
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppTheme.primary)),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: AppTheme.primary),
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppTheme.primary, width: 2.0)),
                            hintText: "987-654-3210",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            )),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Phone number (+91 987-654-3210)';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(width: 45),
                        Icon(Icons.info, color: Colors.grey, size: 20.0),
                        SizedBox(width: 10.0),
                        Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'We will send ',
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
                                text: ' to this mobile number',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400)),
                          ])),
                        ),
                        SizedBox(width: 30),
                      ],
                    ),
                    SizedBox(
                      height: 25,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OtpScreen(),
                              ),
                            );
                          },
                          textColor: Colors.white,
                          color: AppTheme.primary,
                          child: Text(
                            "Get OTP",
                            style: TextStyle(
                              fontFamily: AppTheme.fontName,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 0.0,
                              color: AppTheme.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(bottom: 5),
                    ),

                    Text(
                      'OR',
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 0.0,
                        color: AppTheme.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    // sign in with google button
                    // sign in with google button
                    Padding(
                      padding: EdgeInsets.only(bottom: 30),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        _message,
                        style: TextStyle(
                            color: Colors.white, backgroundColor: Colors.red),
                      ),
                    )
                  ],
                )
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


  // Exmaple code of how to veify phone number
  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _message = 'Received phone auth credential: $phoneAuthCredential';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      setState(() {
        _message = 'Please check your phone for the verification code.';
      });
//      Scaffold.of(context).showSnackBar(SnackBar(
//        content:
//            const Text('Please check your phone for the verification code.'),
//      ));
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }
}
