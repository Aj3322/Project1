import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SharedPrefController extends GetxController {
  RxBool isLoggedIn = false.obs;
  RxString uid = ''.obs;
  static const String _keyIsLoggedIn = 'isLoggedIn';
  static const String _keyUid = 'uid';
  final box = GetStorage();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void onInit() {
    super.onInit();
    initializeValues();
  }
  Future<void> initializeValues() async {
    isLoggedIn.value = box.read(_keyIsLoggedIn) ?? false;
    uid.value = box.read(_keyUid) ?? '';
    if (!isLoggedIn.value) {
      await checkFirebaseAuth();
    }
  }

   checkFirebaseAuth(){
    User? user = _auth.currentUser;
    if (user != null) {
      isLoggedIn.value = true;
      uid.value = user.uid;
      saveAuthDataToStorage(user.uid);
      return true;
    }
    return false;
  }

  Future<void> setLoginData(String uid) async {
    saveAuthDataToStorage(uid);
    isLoggedIn.value = true;
    this.uid.value = uid;
  }

  Future<void> clearLoginData() async {
    await box.erase();
    // Update values in the controller
    isLoggedIn.value = false;
    uid.value = '';
  }

  Future<void> saveAuthDataToStorage(String uid) async {
    await box.write(_keyIsLoggedIn, true);
    await box.write(_keyUid, uid);
  }
}
