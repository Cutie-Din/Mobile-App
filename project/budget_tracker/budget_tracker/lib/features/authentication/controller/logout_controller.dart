import 'package:budget_tracker/features/authentication/screens/login/login.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    await prefs.clear();
    Get.off(() => LoginScreen());
  }
}
