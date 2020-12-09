import 'dart:io';

import 'package:ncert/auth/auth.dart';
import 'package:ncert/models/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PdfBloc extends Controller{
  Directory _appDirectory;

  _setAppDirectory() async {
    _appDirectory = await getApplicationDocumentsDirectory();
  }

  Future<String> getAppDirPath() async {
    if (_appDirectory == null) await _setAppDirectory();
    return _appDirectory.path;
  }

  Future<bool> isNotPdfExists(Content content) async =>
      FileSystemEntity.typeSync(await getPdfPath(content)) ==
      FileSystemEntityType.notFound;

  Future<String> getPdfPath(Content content) async =>
      '${await getAppDirPath()}/${content.id}${content.url.split('.').last}';

  Future<bool> isDownloadable(Content content) async =>
      await isNotPdfExists(content) || await isContentUpdated(content);

  Future<bool> isContentUpdated(Content content) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("content version: ${content.version}");
    return content.version != prefs.getString('${content.id}');
  }
}
