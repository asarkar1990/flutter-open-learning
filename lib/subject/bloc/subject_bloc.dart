import 'dart:async';

import 'package:ncert/auth/auth.dart';
import 'package:ncert/models/model.dart';

import 'subject_repository.dart';

class SubjectBloc extends Controller {
  SubjectRepository _repository = SubjectRepository();

  Stream<List<Map<Category, List<Subject>>>> categoryWiseSubjects(
          String standardId) =>
      _repository.subjects(standardId).map((list) {
        var _subjects = list;
        var categories = <Category>[];
        List<Map<Category, List<Subject>>> _cs = [];
        for (Subject s in _subjects) {
          if (s.categories != null && s.categories.isNotEmpty) {
            categories.addAll(s.categories);
          }
        }
        categories = categories.toSet().toList();
        for (Category _category in categories) {
          var _list = <Subject>[];
          for (Subject _s in _subjects) {
            if (_s.categories.contains(_category)) {
              _list.add(_s);
            }
          }
          _cs.add({_category: _list});
        }
        return _cs;
      });
}
