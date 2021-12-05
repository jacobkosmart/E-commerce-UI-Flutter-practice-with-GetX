import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  List<String> categories = ["Hand bag", "Jewellery", "Footwear", "Dresses"];

  // default first item will be selected
  RxInt selectedIndex = 0.obs;

  void changeTabIndex(int value) {
    selectedIndex.value = value;
  }
}
