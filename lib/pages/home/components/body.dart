import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/pages/home/components/categories.dart';
import 'package:e_commerce_app_ui/pages/home/components/item_card.dart';
import 'package:e_commerce_app_ui/pages/home/home_controller.dart';
import 'package:e_commerce_app_ui/repository/fetch_db.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends GetView<HomeController> {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Category(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.74,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Get.toNamed("/details/$index");
                },
                child: ItemCard(
                  product: products[index],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
