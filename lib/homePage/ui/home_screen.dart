import 'package:admob_flutter/admob_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:ncert/ads/app_credentials.dart';
import 'package:ncert/appUpdater/app_updater.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/models/model.dart';
import 'package:ncert/resource/resource.dart';
import 'package:ncert/subject/bloc/subject_bloc.dart';
import 'package:ncert/widgets/content_screen.dart';
import 'package:ncert/widgets/drawer.dart';
import 'package:ncert/widgets/icon.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();
    interstitialAd = AdmobInterstitial(
      adUnitId: interstitialAdId,
    );
    interstitialAd.load();
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFAFAFA).withOpacity(0.9),
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        iconTheme: IconThemeData(
          color: AppTheme.white,
        ),
      ),
      body: Column(
        children: <Widget>[
          GetBuilder<AppUpdaterBloc>(
              init: AppUpdaterBloc(),
              initState: (_) => Get.find<AppUpdaterBloc>().checkForUpdate(),
              builder: (updater) {
                if (updater.updateAvailable) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Please update to latest version'),
                      SizedBox(
                        width: 20.0,
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        onPressed: () {
                          InAppUpdate.performImmediateUpdate();
                        },
                        child: Text('Update'),
                      )
                    ],
                  );
                } else
                  return Container();
              }),
          Expanded(
            child: GetBuilder<AuthController>(
              builder: (authServiceRM) =>
                  StreamBuilder<List<Map<Category, List<Subject>>>>(
                stream: Get.put(SubjectBloc())
                    .categoryWiseSubjects(authServiceRM.user.standard.id),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Map<Category, List<Subject>>>>
                        snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data;
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) => _categoryBuilder(
                            context,
                            data[index].keys.first,
                            data[index].values.first));
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Something went wrong'));
                  } else
                    return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ),
          Container(
            height: 80.0,
            child: AdmobBanner(
              adUnitId: bannerAdId,
              adSize: AdmobBannerSize.BANNER,
            ),
          ),
        ],
      ),
    );
  }

  _categoryBuilder(
      BuildContext context, Category _category, List<Subject> _subjects) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildCategory(context, _category, _subjects),
      ],
    );
  }

  _buildCategory(
      BuildContext context, Category _category, List<Subject> _subjects) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ScrollOnExpand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Builder(
              builder: (context) {
                var controller = ExpandableController.of(context);
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.only(left: 10),
                  title: Text(
                    _category.name,
                    style: TextStyle(
                        color: AppTheme.lightText,
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(
                    controller.expanded
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    size: 40,
                    color: Colors.blueGrey,
                  ),
                  onTap: () {
                    controller.toggle();
                  },
                );
              },
            ),
            Expandable(
              collapsed: _listBuilder(context, _subjects, _category),
              expanded: _gridBuilder(context, _subjects, _category),
            ),
          ],
        ),
      ),
    ));
  }

  buildIcon(Subject _subject) {
    if (_subject.iconUrl == null) {
      return buildDefaultSubjectIcon();
    } else {
      return CachedNetworkImage(
        imageUrl: downloadUrl(_subject.iconUrl),
        placeholder: (context, url) => buildDefaultSubjectIcon(),
        errorWidget: (context, url, error) => buildDefaultSubjectIcon(),
        fadeInDuration: Duration(seconds: 1),
        width: 35,
      );
    }
  }

  _gridBuilder(
      BuildContext context, List<Subject> subjects, Category category) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: subjects.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) =>
            buildItem(context, subjects[index], category));
  }

  buildItem(BuildContext context, Subject subject, Category category) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      height: 110,
      width: 110,
      decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xff2454d8).withOpacity(0.2),
              offset: Offset(1.1, 4.0),
              blurRadius: 4.0,
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: InkWell(
        highlightColor: Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        onTap: () async {
          interstitialAd.show();
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ContentScreen(subject, category)),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildIcon(subject),
            SizedBox(
              height: 5,
            ),
            Text(
              subject.title,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                fontWeight: FontWeight.w500,
                fontSize: 12,
//                letterSpacing: 0.2,
                color: AppTheme.lightText,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _listBuilder(
      BuildContext context, List<Subject> subjects, Category category) {
    return Container(
      height: 120,
//      width: 115,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: subjects.length,
          itemBuilder: (context, index) =>
              buildItem(context, subjects[index], category)),
    );
  }
}
