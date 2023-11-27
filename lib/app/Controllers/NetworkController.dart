import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkController extends GetxController {
  RxBool isConnected = true.obs;
  RxString connectionType = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Initial check for network status
    checkConnectivity();
    // Listen for changes in network connectivity
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      checkConnectivity();
    });
  }

  Future<void> checkConnectivity() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    updateConnectivityInfo(result);
  }

  void updateConnectivityInfo(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.none:
        isConnected.value = false;
        connectionType.value = 'No Connection';
        break;
      case ConnectivityResult.mobile:
        isConnected.value = true;
        connectionType.value = 'Mobile Data';
        break;
      case ConnectivityResult.wifi:
        isConnected.value = true;
        connectionType.value = 'Wi-Fi';
        break;
      case ConnectivityResult.ethernet:
        isConnected.value = true;
        connectionType.value = 'Ethernet';
        break;
      case ConnectivityResult.vpn:
        isConnected.value = true;
        connectionType.value = 'VPN';
        break;
      case ConnectivityResult.bluetooth:
      //   isConnected.value = true;
        connectionType.value = 'Bluetooth';
        break;
      case ConnectivityResult.other:
        // isConnected.value = true;
        connectionType.value = 'Other';
        break;
    }
  }
}
