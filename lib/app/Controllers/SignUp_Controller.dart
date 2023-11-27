import 'package:animal/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SharedPrifrence.dart';

class SignUpController extends GetxController with StateMixin<User?> {
  SharedPrefController sharedPrefController =
  Get.find<SharedPrefController>();
  @override
  void onInit() {
    change(null, status: RxStatus.success());
    super.onInit();
  }
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void signUp(String email, String password) async {
    try {
      change(null, status: RxStatus.loading()); // Set loading state
      final UserCredential userCredential =
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      change(userCredential.user, status: RxStatus.success()); // Set success state
      sharedPrefController.setLoginData(_auth.currentUser!.uid);
      Get.offNamed(Routes.HOME);
    } on FirebaseAuthException catch (error) {
      print(error);
      String errorMessage = _mapFirebaseErrorToMessage(error.code);
      change(null, status: RxStatus.error(errorMessage)); // Set error state
      Get.snackbar('Error', errorMessage);
      change(null, status: RxStatus.success());
    }
  }
  String _mapFirebaseErrorToMessage(String errorCode) {
    switch (errorCode) {
      case 'email-already-in-use':
        return 'The provided email is already in use by an existing account.';
      case 'weak-password':
        return 'The password must be at least 6 characters long.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}
