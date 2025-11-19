import 'package:get/state_manager.dart';

class TabStatisticalController extends GetxController {
  var selectedTabIndex = 0.obs;
  // index of touched pie section, -1 means none
  var touchedIndex = (-1).obs;

  //change tab index
  void changeTabIndex(int index) {
    selectedTabIndex.value = index;
  }

  void setTouchedIndex(int index) {
    touchedIndex.value = index;
  }
}
