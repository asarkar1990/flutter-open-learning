//import 'package:flutter/material.dart';
//import 'package:ncert/auth/auth.dart';
//import 'package:ncert/auth/ui/login_or_phone_screen.dart';
//import 'package:ncert/css/appTheme.dart';
//import 'package:ncert/standard/standard_selection_screen.dart';
//import 'package:states_rebuilder/states_rebuilder.dart';
//
//class AccountDetails extends StatefulWidget {
//  static const String routeName = "/accountdetails";
//
//  @override
//  _AccountDetailsState createState() => _AccountDetailsState();
//}
//
//class _AccountDetailsState extends State<AccountDetails> {
//  ReactiveModel<AuthService> authService =
//      Injector.getAsReactive<AuthService>();
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: AppTheme.white,
//      appBar: AppBar(
//        titleSpacing: 0,
//        backgroundColor: AppTheme.primary,
//        title: StreamBuilder(
//          stream: authService.state.auth.onAuthStateChanged,
//          builder: (context, snapshot) {
//            if (snapshot.data != null && snapshot.data.photoUrl != null) {
//              return Text(
//                snapshot.data.name,
//              );
//            } else {
//              return Text('NCERT User');
//            }
//          },
//        ),
//        actions: <Widget>[
//          StreamBuilder(
//            stream: authService.state.auth.onAuthStateChanged,
//            builder: (context, snapshot) {
//              if (snapshot.data != null && snapshot.data.photoUrl != null) {
//                return Padding(
//                  padding: const EdgeInsets.all(4.0),
//                  child: CircleAvatar(
//                    backgroundImage: NetworkImage(snapshot.data.photoUrl),
//                    radius: 30.0,
//                  ),
//                );
//              } else {
//                return Padding(
//                  padding: const EdgeInsets.all(6.0),
//                  child: CircleAvatar(
//                    backgroundColor: AppTheme.white,
//                    backgroundImage: AssetImage('assets/KID1.png'),
//                    radius: 30.0,
//                  ),
//                );
//              }
//            },
//          ),
//        ],
//      ),
//      body: ListView(
//        children: <Widget>[
//          Column(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: <Widget>[
//              Padding(
//                padding: const EdgeInsets.only(top: 0.0),
//                child: Image.asset(
//                  'assets/undraw_files_6b3d.png',
//                  width: MediaQuery.of(context).size.width / 1.8,
//                ),
//              ),
//              SizedBox(
//                height: 20,
//              ),
//              Container(
////              padding: const EdgeInsets.only(top:50,bottom: 80),
////              color: Colors.indigo[800],
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    ListTile(
//                      title: Text("Class 7",
//                          textAlign: TextAlign.center,
//                          style: TextStyle(
//                              fontWeight: FontWeight.w700,
//                              fontSize: 40,
//                              color: AppTheme.primary)),
//                      subtitle:
//                          Text('( CBSE Board )', textAlign: TextAlign.center),
//                      trailing: FloatingActionButton(
//                        heroTag: 1,
//                        mini: true,
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) =>
//                                      StandardSelectionScreen()));
//                        },
//                        child: Icon(
//                          Icons.edit,
//                          color: AppTheme.primary,
//                        ),
//                        backgroundColor: AppTheme.white,
//                      ),
//                    ),
//                    Divider(),
//                    ListTile(
//                      subtitle: Text('School Name'),
//                      title: Text('Amtali Class XII School',
//                          style: TextStyle(
//                              fontWeight: FontWeight.w500,
//                              color: AppTheme.lightText)),
//                      leading: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Icon(
//                            Icons.school,
//                            color: AppTheme.primary,
//                          ),
//                        ],
//                      ),
//                      trailing: FloatingActionButton(
//                        heroTag: 2,
//                        mini: true,
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) =>
//                                      StandardSelectionScreen()));
//                        },
//                        child: Icon(
//                          Icons.edit,
//                          color: AppTheme.primary,
//                        ),
//                        backgroundColor: AppTheme.white,
//                      ),
//                    ),
//                    ListTile(
//                      title: Text('(+91) 9436 999 292',
//                          style: TextStyle(
//                              fontWeight: FontWeight.w500,
//                              color: AppTheme.lightText)),
//                      subtitle: Text('Registered Mobile Number'),
//                      leading: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Icon(
//                            Icons.phone_android,
//                            color: AppTheme.primary,
//                          ),
//                        ],
//                      ),
//                      trailing: FloatingActionButton(
//                        heroTag: 3,
//                        mini: true,
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) => LoginScreen()));
//                        },
//                        child: Icon(
//                          Icons.edit,
//                          color: AppTheme.primary,
//                        ),
//                        backgroundColor: AppTheme.white,
//                      ),
//                    ),
//                    ListTile(
//                      title: Text('info@auradix.com',
//                          style: TextStyle(
//                              fontWeight: FontWeight.w500,
//                              color: AppTheme.lightText)),
//                      subtitle: Text('Registered Email Id'),
//                      leading: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          Icon(
//                            Icons.mail_outline,
//                            color: AppTheme.primary,
//                          ),
//                        ],
//                      ),
//                      trailing: FloatingActionButton(
//                        heroTag: 4,
//                        mini: true,
//                        onPressed: () {
//                          Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                  builder: (context) =>
//                                      StandardSelectionScreen()));
//                        },
//                        child: Icon(
//                          Icons.edit,
//                          color: AppTheme.primary,
//                        ),
//                        backgroundColor: AppTheme.white,
//                      ),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ],
//      ),
//    );
//  }
//}
