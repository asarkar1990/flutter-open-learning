import 'package:ncert/models/database.dart';
import 'package:ncert/models/model.dart';

class SubjectRepository {
  var _db = Database.subjects;

  Stream<List<Subject>> subjects(String standardId) {
    return _db.where('standard.id', isEqualTo: standardId).snapshots().map(
        (list) =>
            list.documents.map((doc) => Subject.fromFirestore(doc)).toList());
  }
}
