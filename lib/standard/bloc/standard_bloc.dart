import 'package:ncert/auth/auth.dart';
import 'package:ncert/models/model.dart';

import 'standard_repository.dart';

class StandardBloc extends Controller {
  StandardRepository _repository = StandardRepository();
  List<Standard> standards = [];

  init() async {
    if (standards.isEmpty) {
      standards = await _repository.standards();
    }
  }
}
