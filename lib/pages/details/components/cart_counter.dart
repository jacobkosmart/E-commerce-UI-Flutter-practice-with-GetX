import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/pages/details/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCounter extends GetView<DetailController> {
  const CartCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildOutlineButton(
          icon: Icons.remove,
          press: controller.decremnetsDartCount,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
          child: Obx(
            () => Text(
                // If item is less then 10 then it show like 01, 02 like that
                controller.numOfItems.value.toString().padLeft(2, "0"),
                style: Theme.of(context).textTheme.headline6),
          ),
        ),
        buildOutlineButton(
          icon: Icons.add,
          press: controller.incremnetsCartCount,
        ),
      ],
    );
  }

  SizedBox buildOutlineButton({IconData? icon, Function? press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          press!();
        },
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
    );
  }
}
