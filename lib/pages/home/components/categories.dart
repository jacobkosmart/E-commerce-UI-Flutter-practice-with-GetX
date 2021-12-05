import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Category extends GetView<HomeController> {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        controller.changeTabIndex(index);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.categories[index],
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: controller.selectedIndex.value == index
                        ? kTextColor
                        : kTextLightColor),
              ),
              Container(
                margin: EdgeInsets.only(top: kDefaultPadding / 4),
                height: 2,
                width: 30,
                color: controller.selectedIndex.value == index
                    ? Colors.black
                    : Colors.transparent,
              )
            ],
          ),
        ),
      ),
    );
  }
}
