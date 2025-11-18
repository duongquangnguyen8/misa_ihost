import 'package:get/get.dart';

class HomeController extends GetxController{
  var currentIndex=0.obs;

  void selectedIndex(int index){
    currentIndex.value=index;
  }

}