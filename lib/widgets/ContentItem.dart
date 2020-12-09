import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/helpers/helper.dart';
import 'package:ncert/models/model.dart';
import 'package:ncert/pdf/bloc/pdfBloc.dart';
import 'package:ncert/pdf/ui/pdfScreen.dart';
import 'package:ncert/resource/resource.dart';
import 'package:ncert/widgets/icon.dart';
import 'package:ncert/widgets/video_player.dart';

final pdfLogo = 'assets/pdf.png';
final downloadLogo = 'assets/download.png';
final Dio dio = Dio();

class ContentItem extends StatefulWidget {
  final Content content;

  ContentItem(this.content);

  @override
  _ContentItemState createState() => _ContentItemState();
}

class _ContentItemState extends State<ContentItem>
    with SingleTickerProviderStateMixin {
  Content content;

  final pdfBloc = Get.put(PdfBloc());

  var progressString = "";

  var downloading = false;

  AnimationController _colorAnimationController;

  @override
  void initState() {
    super.initState();
    _colorAnimationController = AnimationController(vsync: this);
    content ??= widget.content;
  }

  Widget getLeading() {
    if (downloading) {
      if (progressString == "") {
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppTheme.secondary),
        );
      } else {
        double _barValue = double.parse(progressString);

        Animation<Color> _colorAnimation = ColorTween(
          begin: AppTheme.secondary,
          end: AppTheme.primary,
        ).animate(_colorAnimationController);

        _colorAnimationController.value = _barValue;
        return CircularProgressIndicator(
          value: _barValue,
          valueColor: _colorAnimation,
        );
      }
    } else {
      return content.subject.iconUrl == null
          ? buildDefaultSubjectIcon()
          : FutureBuilder(
              future: pdfBloc.isDownloadable(content),
              builder: (BuildContext context,
                  AsyncSnapshot<dynamic> isDownloadable) {
                if (isDownloadable.hasData)
                  return CachedNetworkImage(
                    color: !isDownloadable.data ? null : Colors.grey,
                    imageUrl: downloadUrl(content.subject.iconUrl),
                    placeholder: (context, url) => buildDefaultSubjectIcon(),
                    errorWidget: (context, url, error) =>
                        buildDefaultSubjectIcon(),
                    fadeInDuration: Duration(seconds: 1),
                  );
                else
                  return SizedBox();
              });
    }
  }

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: SizedBox(
            child: getLeading(),
            width: 30,
            height: 30,
          ),
          title: Text(content.title),
          trailing: getTrailing(),
          onTap: () async {
            var needDownload = await pdfBloc.isDownloadable(content);
            if (needDownload) {
              downloadPdf();
            } else {
              var _path = await pdfBloc.getPdfPath(content);
              //todo: need imporovement in code
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => content.url.split('.').last != "pdf"
                        ? VideoPlayer1(_path)
                        : PDFScreen(content, _path)),
              );
            }
          },
        ),
      );

  Future<void> downloadPdf() async {
    try {
      setState(() {
        downloading = true;
      });
      var url = downloadUrl(content.url, content.version);
      String savePath = await pdfBloc.getPdfPath(content);
      await dio.download(url, savePath, onReceiveProgress: (received, total) {
        if (total != -1) {
          setState(() {
            progressString = (received / total).toString();
          });
          if (double.parse(progressString) == 1.0) {
            Future.delayed(const Duration(milliseconds: 1000), () {
              setState(() {
                progressString = '';
                downloading = false;
              });
            });
          }
        }
      });

      /// set current downloaded version in shared pref
      await addToShardPref(content);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  removeContentFromDevice() async {
    File _pdf = File(await pdfBloc.getPdfPath(content));
    await _pdf.delete();
    await removeFromSharedPerf(content);
    setState(() {});
  }

  getTrailing() {
    return FutureBuilder<bool>(
        initialData: true,
        future: pdfBloc.isNotPdfExists(content),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (!snapshot.data) {
              return PopupMenuButton(
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    value: "${content.id}",
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Icon(Icons.delete),
                        Text('Remove from device'),
                      ],
                    ),
                  ),
                ],
                onSelected: (contentId) => removeContentFromDevice(),
              );
            }
          }
          return SizedBox();
        });
  }
}
