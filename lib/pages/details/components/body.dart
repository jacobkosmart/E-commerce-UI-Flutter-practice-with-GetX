import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/model/product.dart';
import 'package:e_commerce_app_ui/pages/details/components/add_to_cart.dart';
import 'package:e_commerce_app_ui/pages/details/components/color_and_size.dart';
import 'package:e_commerce_app_ui/pages/details/components/counter_with_fav_btn.dart';
import 'package:e_commerce_app_ui/pages/details/components/description.dart';
import 'package:e_commerce_app_ui/pages/details/components/product_title_with_image.dart';
import 'package:e_commerce_app_ui/pages/details/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends GetView<DetailController> {
  final Product? product;

  const Body({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // It provide total height and width
    Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: _size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: _size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: _size.height * 0.12,
                    left: kDefaultPadding,
                    right: kDefaultPadding,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      Discription(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPadding / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductTitileWithImage(product: product)
              ],
            ),
          )
        ],
      ),
    );
  }
}
