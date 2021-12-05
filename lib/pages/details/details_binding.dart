import 'package:e_commerce_app_ui/pages/details/details_controller.dart';
import 'package:get/get.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}
