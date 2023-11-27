import 'package:animal/app/Controllers/SharedPrifrence.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../routes/app_pages.dart';

class LogInController extends GetxController with StateMixin<User?> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
 @override
  void onInit() {
   change(null, status: RxStatus.success());
    super.onInit();
  }

  void logIn(String email, String password) async {
    try {
      change(null, status: RxStatus.loading()); // Set loading state
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      change(userCredential.user,
          status: RxStatus.success()); // Set success state
      Get.find<SharedPrefController>().setLoginData(_auth.currentUser!.uid);
      Get.offNamed(Routes.HOME);
    } on FirebaseAuthException catch (error) {
      String errorMessage = _mapFirebaseErrorToMessage(error.code);
      change(null, status: RxStatus.error(errorMessage));
      Get.snackbar('Error', errorMessage);
      change(null, status: RxStatus.success());
    }
  }

  String _mapFirebaseErrorToMessage(String errorCode) {
    switch (errorCode) {
      case 'user-not-found':
        return 'No user found for that email.';
      case 'wrong-password':
        return 'Wrong password provided for that user.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'The user corresponding to the given email has been disabled.';
      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}
