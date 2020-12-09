import 'package:get/get.dart';
import 'package:ncert/auth/auth.dart';
import 'package:ncert/models/database.dart';
import 'package:ncert/models/model.dart';

class MyAccountRepository {
  var _uDb = Database.profiles;
  AuthController authService = Get.find<AuthController>();

  updateUserStd(Standard std) {
    var user = authService.user;
    if (user.uid != null && std != null) {
      user.rebuild((u) => u..standard = std.toBuilder());
      _uDb.document(user.uid).setData(user.toMap(), merge: true);
    }
  }
}
