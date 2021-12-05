import 'package:get/get.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();

  // Get Parmameter Index
  final productID = int.parse(Get.parameters["productID"]!);

  // CartCounter number
  RxInt numOfItems = 1.obs;

  void incremnetsCartCount() {
    numOfItems.value++;
  }

  void decremnetsDartCount() {
    if (numOfItems.value > 1) {
      numOfItems.value--;
    }
  }
}
