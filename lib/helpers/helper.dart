import 'package:ncert/models/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> addToShardPref(Content content) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('${content.id}', "${content.version}");
}

Future<void> removeFromSharedPerf(Content content) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('${content.id}');
}
