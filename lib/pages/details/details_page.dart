import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/pages/details/details_controller.dart';
import 'package:e_commerce_app_ui/repository/fetch_db.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'components/body.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _index = controller.productID;

    return Scaffold(
      // each product have a color
      backgroundColor: products[_index].color,
      appBar: buildAppBar(_index),
      body: Body(product: products[_index]),
    );
  }

  AppBar buildAppBar(int index) {
    return AppBar(
      backgroundColor: products[index].color,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/search.svg"),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset("assets/icons/cart.svg"),
        ),
        SizedBox(width: kDefaultPadding / 2),
      ],
    );
  }
}
