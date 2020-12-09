import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:get/get.dart';

import 'auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneSignInSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PhoneSignInSectionState();
}

class PhoneSignInSectionState extends State<PhoneSignInSection> {
  AuthController authService = Get.find<AuthController>();

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  String _message = '';
  String _verificationId;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.6),
          ),
          Column(
            children: <Widget>[
              ///holds email header and inputField
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 40, bottom: 10),
                    child: Text(
                      "Sign in with mobile number",
                      style: TextStyle(fontSize: 16, color: Colors.teal),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        // InputWidget(30.0, 0.0),
                        Padding(
                          padding: EdgeInsets.only(right: 40, bottom: 25),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.zero,
                                      topRight: Radius.circular(30.0))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 20, top: 10, bottom: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _phoneNumberController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "+91 987-654-3210",
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
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  'Verify phone number...',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              FloatingActionButton(
                                heroTag: 'btn1',
                                backgroundColor: Colors.blue[600],
                                elevation: 4.0,
                                mini: true,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  _verifyPhoneNumber();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                  ),
                  SingleChildScrollView(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: <Widget>[
                        // InputWidget(30.0, 0.0),
                        Padding(
                          padding: EdgeInsets.only(right: 40, bottom: 25),
                          child: Container(
                            width: MediaQuery.of(context).size.width - 40,
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.zero,
                                      bottomRight: Radius.circular(30.0))),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 40, right: 20, top: 10, bottom: 10),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  controller: _smsController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "-  -  -  -  -  -",
                                      hintStyle: TextStyle(
                                        color: Colors.black26,
                                      )),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 60),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  child: Padding(
                                padding: EdgeInsets.only(top: 40),
                                child: Text(
                                  'Sign in with phone number...',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                      color: Colors.amber[900],
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                              FloatingActionButton(
                                heroTag: 'btn2',
                                backgroundColor: Colors.amber[900],
                                elevation: 4.0,
                                mini: true,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                                onPressed: () async {
                                  _signInWithPhoneNumber();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),

              Text('OR'),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),
              // sign in with google button
              Column(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      GoogleSignInButton(
                          onPressed: () {
                            authService.googleSignIn();
                          },
                          darkMode: true),
                      RaisedButton(
                        child: Text('Login as guest'),
                        onPressed: () {
                          authService.anonymousSignIn();
                        },
                      ),
                    ],
                  ),
                ],
              ),
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
              // roundedRectButton("Let's get Started", signInGradients, true),
              // roundedRectButton("Create an Account", signUpGradients, false),
            ],
          ),
          // Container(
          //   child: const Text('Test sign in with phone number'),
          //   padding: const EdgeInsets.all(16),
          //   alignment: Alignment.center,
          // ),
          // TextFormField(
          //   controller: _phoneNumberController,
          //   decoration:
          //       InputDecoration(labelText: 'Phone number (+x xxx-xxx-xxxx)'),
          //   validator: (String value) {
          //     if (value.isEmpty) {
          //       return 'Phone number (+x xxx-xxx-xxxx)';
          //     }
          //     return null;
          //   },
          // ),
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //   alignment: Alignment.center,
          //   child: RaisedButton(
          //     onPressed: () async {
          //       _verifyPhoneNumber();
          //     },
          //     child: const Text('Verify phone number'),
          //   ),
          // ),
          // TextField(
          //   controller: _smsController,
          //   decoration: InputDecoration(labelText: 'Verification code'),
          // ),
          // Container(
          //   padding: const EdgeInsets.symmetric(vertical: 16.0),
          //   alignment: Alignment.center,
          //   child: RaisedButton(
          //     onPressed: () async {
          //       _signInWithPhoneNumber();
          //     },
          //     child: const Text('Sign in with phone number'),
          //   ),
          // ),
          // Container(
          //   alignment: Alignment.center,
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: Text(
          //     _message,
          //     style: TextStyle(color: Colors.red),
          //   ),
          // )
        ],
      ),
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

Widget roundedRectButton(
    String title, List<Color> gradient, bool isEndIconVisible) {
  return Builder(builder: (BuildContext mContext) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment(1.0, 0.0),
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: MediaQuery.of(mContext).size.width / 1.7,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              gradient: LinearGradient(
                  colors: gradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
            ),
            child: Text(title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500)),
            padding: EdgeInsets.only(top: 16, bottom: 16),
          ),
          Visibility(
            visible: isEndIconVisible,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
//                child: ImageIcon(
//                  AssetImage('assets/images/ic_forward.png'),
//                  size: 30,
//                  color: Colors.white,
//                )
            ),
          ),
        ],
      ),
    );
  });
}

const List<Color> signInGradients = [
  Color(0xFF0EDED2),
  Color(0xFF03A0FE),
];

const List<Color> signUpGradients = [
  Color(0xFFFF9945),
  Color(0xFFFc6076),
];
