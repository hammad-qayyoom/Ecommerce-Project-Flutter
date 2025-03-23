import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:greenage_ecomm/models/user-model.dart';
import 'package:greenage_ecomm/screens/user-panel/main-screen.dart';

class GoogleSignInController extends GetxController {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount == null) {
        // User ne sign-in cancel kar diya
        return;
      }

      EasyLoading.show(status: 'Signing in...');

      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential =
      await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        final userRef =
        FirebaseFirestore.instance.collection('users').doc(user.uid);

        final userSnapshot = await userRef.get();

        if (!userSnapshot.exists) {
          // Agar user pehli dafa login kar raha hai
          UserModel userModel = UserModel(
            uId: user.uid,
            username: user.displayName ?? '',
            email: user.email ?? '',
            phone: user.phoneNumber ?? '',
            userImg: user.photoURL ?? '',
            userDeviceToken: '',
            country: '',
            userAddress: '',
            street: '',
            isAdmin: false,
            isActive: true,
            createdOn: DateTime.now(),
            city: '',
          );

          await userRef.set(userModel.toMap(), SetOptions(merge: true));
        }

        EasyLoading.dismiss();
        Get.offAll(() => MainScreen());
      }
    } catch (error) {
      EasyLoading.dismiss();
      print("Error: $error");
      Get.snackbar("Sign-in Failed", error.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
