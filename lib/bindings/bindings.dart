import 'package:get/get.dart';
import 'package:ncert/appUpdater/app_updater.dart';
import 'package:ncert/auth/auth.dart';

class InitialBindings extends Bindings {
  @override
  dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.put(AppUpdaterBloc());
//    Get.lazyPut<SubjectBloc>(() => SubjectBloc());
//    Get.lazyPut<PdfBloc>(() => PdfBloc());
//    Get.lazyPut<AppUpdaterBloc>(() => AppUpdaterBloc());
//    Get.lazyPut<ContentBloc>(() => ContentBloc());
  }
}
