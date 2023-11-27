import 'package:animal/app/Controllers/NetworkController.dart';
import 'package:animal/app/Controllers/SharedPrifrence.dart';
import 'package:get/get.dart';
class NetworkBinging extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<NetworkController>(() => NetworkController());
    Get.lazyPut<SharedPrefController>(() => SharedPrefController());
  }

}