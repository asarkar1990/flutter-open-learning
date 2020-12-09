import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ncert/models/database.dart';
import 'package:ncert/models/model.dart';

class ContentRepository {
  var _db = Database.contents;

  Future<List<Content>> contentsBySubjectAndCategory(Subject subject, Category category) {
    return _db
        .where('subject.id', isEqualTo: subject.id)
        .where('category.id', isEqualTo: category.id)
        .orderBy('title')
        .getDocuments()
        .then((QuerySnapshot list) =>
            list.documents.map((doc) => Content.fromFirestore(doc)).toList());
  }
}
