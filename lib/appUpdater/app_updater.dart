import 'package:flutter/foundation.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:ncert/auth/auth.dart';

class AppUpdaterBloc extends Controller {
  bool updateAvailable = false;

  Future<void> checkForUpdate() async {
    if (kReleaseMode) {
      var updater = await InAppUpdate.checkForUpdate();
      updateAvailable = updater.updateAvailable;
    }
  }
}
