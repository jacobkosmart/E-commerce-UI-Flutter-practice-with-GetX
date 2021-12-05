import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController {
  static DetailController get to => Get.find();

  final productID = int.parse(Get.parameters["productID"]!);

  // Color Dots selected
  var isSelected = false;

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
