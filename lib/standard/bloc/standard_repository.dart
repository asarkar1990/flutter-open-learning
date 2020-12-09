import 'package:ncert/models/database.dart';
import 'package:ncert/models/model.dart';

class StandardRepository{
  var _db = Database.standards;

  Future<List<Standard>> standards() {
    return _db.orderBy("title").getDocuments().then((list) =>
        list.documents.map((doc) => Standard.fromFirestore(doc)).toList());
  }
}