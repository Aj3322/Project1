import 'package:get/get.dart';

import '../Controllers/SharedPrifrence.dart';
import '../Controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SharedPrefController>(
            ()=> SharedPrefController());
  }
}
