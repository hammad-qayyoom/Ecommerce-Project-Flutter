import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/google-sign-in-controller.dart';
import '../../utils/app-constant.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});

  final GoogleSignInController googleSignInController = Get.put(GoogleSignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appSecondaryColor,
        title: const Text(
          "Welcome to my app",
          style: TextStyle(color: AppConstant.appTextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Lottie.asset('assets/images/splash-icon.json'),
          const SizedBox(height: 20),
          const Text(
            "Happy Shopping",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: Get.height / 12),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12,
              decoration: BoxDecoration(
                color: AppConstant.appSecondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton.icon(
                onPressed: () {
                  googleSignInController.signInWithGoogle();
                },
                icon: Image.asset(
                  'assets/images/final-google-logo.png',
                  width: Get.width / 12,
                  height: Get.height / 12,
                ),
                label: const Text(
                  "Sign With Google",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height / 50),
          Material(
            child: Container(
              width: Get.width / 1.2,
              height: Get.height / 12,
              decoration: BoxDecoration(
                color: AppConstant.appSecondaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton.icon(
                onPressed: () {

                },
                icon: const Icon(
                  Icons.email,
                  color: AppConstant.appTextColor,
                ),
                label: const Text(
                  "Sign With Email",
                  style: TextStyle(color: AppConstant.appTextColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
