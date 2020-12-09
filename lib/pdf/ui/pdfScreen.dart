import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/models/model.dart';

class PDFScreen extends StatelessWidget {
  final String pathPDF;
  final Content content;

  PDFScreen(this.content, this.pathPDF);

  @override
  Widget build(BuildContext context) {
    return PDFViewerScaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text("${content.title}"),
      ),
      path: pathPDF,
      primary: true,
    );
  }
}
