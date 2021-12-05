import 'package:e_commerce_app_ui/constants.dart';
import 'package:e_commerce_app_ui/pages/details/details_binding.dart';
import 'package:e_commerce_app_ui/pages/details/details_page.dart';
import 'package:e_commerce_app_ui/pages/home/home_binding.dart';
import 'package:e_commerce_app_ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-commerce-UI-APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => HomePage(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: "/details/:productID",
          page: () => DetailPage(),
          binding: DetailsBinding(),
        ),
      ],
    );
  }
}
