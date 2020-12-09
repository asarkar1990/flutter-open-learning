import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:ncert/models/model.dart';
import 'package:path_provider/path_provider.dart';

class PdfGenerator {
  static Directory _appDirectory;

  static get localDocDirPath async {
    if (_appDirectory == null) {
      _appDirectory = await getApplicationDocumentsDirectory();
    }
    return _appDirectory.path;
  }

  static Future<File> createFileOfPdfUrl(Content chapter) async {
    var url = chapter.url;
    final filename = '${chapter.id}.pdf';
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = await localDocDirPath;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);
    return file;
  }

  static isPdfExists(pdfPath) {
    return FileSystemEntity.typeSync(pdfPath) != FileSystemEntityType.notFound;
  }
}
