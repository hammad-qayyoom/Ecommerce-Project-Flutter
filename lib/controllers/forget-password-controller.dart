import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../utils/app-constant.dart';

class ForgetPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> sendPasswordResetEmail(String userEmail) async {
    try {
      EasyLoading.show(status: "Please Wait");
      await _auth.sendPasswordResetEmail(email: userEmail);
      EasyLoading.dismiss();

      Get.snackbar("Success", "Password reset email sent successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondaryColor,
          colorText: AppConstant.appTextColor);
    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appSecondaryColor,
          colorText: AppConstant.appTextColor);
    }
  }
}
