import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncert/content/bloc/content_bloc.dart';
import 'package:ncert/css/appTheme.dart';
import 'package:ncert/models/model.dart';
import 'package:ncert/widgets/ContentItem.dart';

class ContentScreen extends StatelessWidget {
  static String routeName = "/content";
  Subject subject;
  Category category;
  ContentBloc _contentBloc = Get.put(ContentBloc());

  ContentScreen(this.subject, this.category);

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color(0xFAFAFA).withOpacity(0.9),
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        title: Text("${category.name}"),
      ),
      body: GetBuilder<ContentBloc>(
        initState: (_) =>
            _contentBloc.setState((s) => s.getContents(subject, category)),
        builder: (bloc) => bloc.processing
            ? Center(child: CircularProgressIndicator())
            : buildContent(bloc.contents),
      ));

  buildContent(List<Content> contents) => Container(
        child: ListView.builder(
          itemCount: contents.length,
          itemBuilder: (context, index) => ContentItem(contents[index]),
        ),
      );
}
