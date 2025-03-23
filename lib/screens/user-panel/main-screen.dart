import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenage_ecomm/screens/auth-ui/welcome-screen.dart';

import '../../controllers/google-sign-in-controller.dart';
import '../../utils/app-constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GoogleSignInController googleSignInController =
    Get.put(GoogleSignInController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appMainColor,
        title: const Text("GreenAge"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () async {
              try {
                await FirebaseAuth.instance.signOut(); // Firebase logout
                await googleSignInController.googleSignIn.signOut(); // Google logout
                Get.offAll(() =>  WelcomeScreen()); // Navigate to WelcomeScreen
              } catch (error) {
                Get.snackbar("Logout Failed", error.toString(),
                    snackPosition: SnackPosition.BOTTOM);
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.logout),
            ),
          ),
        ],
      ),
    );
  }
}
