// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:greenage_ecomm/controllers/sign-in-controller.dart';
import 'package:greenage_ecomm/screens/auth-ui/forget-password-screen.dart';
import 'package:lottie/lottie.dart';
import '../../utils/app-constant.dart';
import '../user-panel/main-screen.dart';
import 'sign-up-screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController signInController = Get.put(SignInController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondaryColor,
            title: Text(
              "Sign In",
              style: TextStyle(color: AppConstant.appTextColor),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
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
                          hintStyle: TextStyle(color: AppConstant.appSecondaryColor),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Obx(
                            () => TextField(
                          controller: userPassword,
                          obscureText: signInController.isPasswordVisible.value,
                          cursorColor: AppConstant.appSecondaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppConstant.appSecondaryColor,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                signInController.isPasswordVisible.toggle();
                              },
                              child: Icon(
                                signInController.isPasswordVisible.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                            contentPadding: EdgeInsets.only(top: 10.0, left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: AppConstant.appSecondaryColor),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 11.0),
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => ForgetPasswordScreen());
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(
                          color: AppConstant.appSecondaryColor,
                          fontWeight: FontWeight.bold,
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
                          String password = userPassword.text.trim();

                          if (email.isEmpty || password.isEmpty) {
                            Get.snackbar(
                              "Error",
                              "Please fill all the fields",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appSecondaryColor,
                              colorText: AppConstant.appTextColor,
                            );
                          } else {
                            UserCredential? userCredential =
                            await signInController.signInMethod(email, password);
                            if (userCredential != null) {
                              if (userCredential.user!.emailVerified) {
                                Get.snackbar(
                                  "Success",
                                  "Login Successfully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appSecondaryColor,
                                  colorText: AppConstant.appTextColor,
                                );
                                Get.offAll(() => MainScreen());
                              } else {
                                Get.snackbar(
                                  "Error",
                                  "Please verify your email",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appSecondaryColor,
                                  colorText: AppConstant.appTextColor,
                                );
                              }
                            } else {
                              Get.snackbar(
                                "Error",
                                "Please Try Again",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appSecondaryColor,
                                colorText: AppConstant.appTextColor,
                              );
                            }
                          }
                        },
                        label: const Text(
                          "Sign In",
                          style: TextStyle(color: AppConstant.appTextColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height / 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(color: AppConstant.appSecondaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(SignUpScreen());
                        },
                        child: Text(
                          " Sign Up",
                          style: TextStyle(
                            color: AppConstant.appSecondaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
