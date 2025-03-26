// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:greenage_ecomm/controllers/forget-password-controller.dart';
import 'package:lottie/lottie.dart';
import '../../utils/app-constant.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final ForgetPasswordController forgetPasswordController =
  Get.put(ForgetPasswordController());
  TextEditingController userEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondaryColor,
            title: Text(
              "Forgot Password",
              style: TextStyle(color: AppConstant.appTextColor),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                isKeyboardVisible
                    ? SizedBox.shrink()
                    : Column(
                  children: [
                    Lottie.asset('assets/images/splash-icon.json'),
                  ],
                ),
                SizedBox(height: Get.height / 20),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: userEmail,
                      cursorColor: AppConstant.appSecondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: AppConstant.appSecondaryColor,
                        ),
                        contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: 'Email',
                        hintStyle:
                        TextStyle(color: AppConstant.appSecondaryColor),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 20),
                Material(
                  child: Container(
                    width: Get.width / 2,
                    height: Get.height / 18,
                    decoration: BoxDecoration(
                      color: AppConstant.appSecondaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton.icon(
                      onPressed: () async {
                        String email = userEmail.text.trim();

                        if (email.isEmpty) {
                          Get.snackbar(
                            "Error",
                            "Please enter your email",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        } else {
                          await forgetPasswordController
                              .sendPasswordResetEmail(email);
                        }
                      },
                      label: const Text(
                        "Reset Password",
                        style: TextStyle(color: AppConstant.appTextColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
