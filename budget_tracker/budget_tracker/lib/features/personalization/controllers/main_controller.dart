import 'package:get/get.dart';

class MainScreenController extends GetxController {
  var selectedTab = ''.obs;

  void setSelectedTab(String tab) {
    selectedTab.value = tab;
  }
}
