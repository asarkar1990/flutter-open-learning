import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ncert/models/constants.dart';

class Database {
  static final _app = Firestore.instance;
  static final CollectionReference profiles = _app.collection(Constants.users);
  static final CollectionReference standards =
      _app.collection(Constants.standards);
  static final CollectionReference subjects =
      _app.collection(Constants.subjects);
  static final CollectionReference contents =
      _app.collection(Constants.contents);
}

final Database database = Database();
