import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/model/product.dart';
import 'package:flutter/material.dart';

class Discription extends StatelessWidget {
  const Discription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      child: Text(
        product!.description!,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
