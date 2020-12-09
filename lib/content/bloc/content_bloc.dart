import 'dart:async';

import 'package:ncert/auth/auth.dart';
import 'package:ncert/models/model.dart';

import 'content_repository.dart';

class ContentBloc extends Controller{
  StreamSubscription _subscription;

  final ContentRepository _contentRepository = ContentRepository();

  Content content;

  List<Content> _contents = [];

  List<Content> get contents => _contents;

  getContents(Subject _subject, Category _category) async {
    _contents = await _contentRepository.contentsBySubjectAndCategory(_subject, _category);
  }

  void dispose() {
    _subscription.cancel();
  }

  setSubjectCategory(Subject subject, Category category) {
    subject = subject;
    category = category;
  }
}
