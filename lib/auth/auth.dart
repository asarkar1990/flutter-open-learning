import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ncert/models/database.dart';
import 'package:ncert/models/model.dart';

class BaseController extends GetxController {}

class Controller extends BaseController {
  bool _processing = false;

  bool get processing => _processing;

  setState(Function(dynamic s) fn) async {
    _processing = true;
    update();
    await fn(this);
    _processing = false;
    update();
  }
}

class AuthController extends Controller {
  // Dependencies
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseAuth get auth => _auth;
  var _db = Database.profiles;

  // Shared State for Widgets
  User _user;

  User get user => _user;

  set user(User value) {
    _user = value;
  }

  setCurrentUser() async {
    var firebaseUser = await _auth.currentUser();
    if (firebaseUser != null) {
      var _userRef = _db.document(firebaseUser.uid);
      var _userSnapShot = await _userRef.get();
      if (_userSnapShot.exists) {
        user = User.fromFirestore(_userSnapShot);
      } else {
        user = User((_u) => _u
          ..uid = firebaseUser.uid
          ..name = firebaseUser.displayName
          ..email = firebaseUser.email
          ..photoUrl = firebaseUser.photoUrl
          ..isAnonymous = firebaseUser.isAnonymous);
        _userRef.setData(user.toMap(), merge: true);
      }
    } else {
      user = null;
    }
  }

  Future<FirebaseUser> googleSignIn() async {
    // Step 1
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();

    // Step 2
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;

    print("signed in : ${user.displayName}");
    await setCurrentUser();

    return user;
  }

  anonymousSignIn() async {
    await _auth.signInAnonymously();
    await setCurrentUser();
  }

  anonymousToGoogle() async {
    //Todo:: before link check if the user is already exists in firebase authentication user list
    await _googleSignIn.signOut();
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    FirebaseUser firebaseUser = await _auth.currentUser();
    AuthResult authResult =
        await firebaseUser.linkWithCredential(credential).catchError((error) {
      if (error.code == "ERROR_CREDENTIAL_ALREADY_IN_USE") {
        print(error.message);
      }
    });
    if (authResult != null) {
      print('After link Auth Result: $authResult');

      // update app user doc after linked
      var profileRef = _db.document(authResult.user.uid);
      var profileDoc = await profileRef.get();
      user = User.fromFirestore(profileDoc);
      var providerData = authResult.user.providerData[1];
      user = user.rebuild((u) => u
        ..name ??= providerData.displayName
        ..email ??= providerData.email
        ..photoUrl ??= providerData.photoUrl
        ..isAnonymous = false);
      profileRef.setData(user.toMap(), merge: true);
    } else {
      await googleSignIn();
    }
  }

  Future<void> updateStandard(Standard std) {
    if (user != null) {
      user = user.rebuild((_u) => _u..standard = std.toBuilder());
      var profileRef = _db.document(user.uid);
      return profileRef.setData(user.toMap());
    }
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    user = null;
  }

  @override
  void onInit() {
    setCurrentUser();
    super.onInit();
  }
}
