import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/models/model.dart';
import 'package:ncert/standard/bloc/standard_bloc.dart';

class StandardSelectionScreen extends StatelessWidget {
  static const String routeName = "/standardselection";
  StandardBloc _standardBloc = Get.put(StandardBloc());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Image.asset(
              'assets/undraw_reading_0re1.png',
              width: MediaQuery.of(context).size.width / 1.5,
            ),
            SizedBox(
              height: 35,
            ),
            Text(
              'Select Your Class',
              style: TextStyle(fontSize: 36, color: AppTheme.primary),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              height: 240.0,
              child: GetBuilder<StandardBloc>(
                initState: (_) => _standardBloc.setState((s) => s.init()),
                builder: (StandardBloc standardBloc) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: standardBloc.standards.length + 1,
                    itemBuilder: (context, index) {
                      return standardBuilder(
                          context,
                          index != standardBloc.standards.length
                              ? standardBloc.standards[index]
                              : null,
                          index,
                          standardBloc.standards.length);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  standardBuilder(BuildContext context, Standard standard, int index, length) {
    return index != length
        ? Padding(
            padding:
                const EdgeInsets.only(left: 60, bottom: 16, right: 16, top: 16),
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xff1E1466).withOpacity(0.6),
                      offset: Offset(1.1, 4.0),
                      blurRadius: 8.0),
                ],
                gradient: LinearGradient(
                  colors: [Color(0xff6800FB), Color(0xff6800FB)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: InkWell(
                highlightColor: Colors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                onTap: () async {
                  await Get.find<AuthController>()
                      .setState((s) => s.updateStandard(standard));
                  //todo: implement onError
                  Get.back();
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      standard.title.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        letterSpacing: 0.2,
                        color: AppTheme.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : SizedBox(
            width: 80,
          );
  }
}
