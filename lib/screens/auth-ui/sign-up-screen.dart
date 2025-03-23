// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import '../../utils/app-constant.dart';
import 'sign-in-screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
        // Fixed: Added builder function
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppConstant.appSecondaryColor,
            title: Text(
              "Sign Up",
              style: TextStyle(color: AppConstant.appTextColor),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centers children vertically in the Column
                      children: [
                        Text(
                          "Welcome to My App",
                          style: TextStyle(
                            color: AppConstant.appSecondaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: Get.height / 20),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          cursorColor: AppConstant.appSecondaryColor,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: AppConstant.appSecondaryColor,
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Email',
                            hintStyle:
                                TextStyle(color: AppConstant.appSecondaryColor),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          cursorColor: AppConstant.appSecondaryColor,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppConstant.appSecondaryColor,
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'UserName',
                            hintStyle:
                                TextStyle(color: AppConstant.appSecondaryColor),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          cursorColor: AppConstant.appSecondaryColor,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone,
                              color: AppConstant.appSecondaryColor,
                            ),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Phone Number',
                            hintStyle:
                                TextStyle(color: AppConstant.appSecondaryColor),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          cursorColor: AppConstant.appSecondaryColor,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_city,
                              color: AppConstant.appSecondaryColor,
                            ),
                            suffixIcon: Icon(Icons.visibility_off),
                            contentPadding:
                            EdgeInsets.only(top: 10.0, left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'City',
                            hintStyle:
                            TextStyle(color: AppConstant.appSecondaryColor),
                          )),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    width: Get.width,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                          cursorColor: AppConstant.appSecondaryColor,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: AppConstant.appSecondaryColor,
                            ),
                            suffixIcon: Icon(Icons.visibility_off),
                            contentPadding:
                                EdgeInsets.only(top: 10.0, left: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(color: AppConstant.appSecondaryColor),
                          )),
                    ),
                  ),

                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Material(
                    child: Container(
                      width: Get.width / 2,
                      height: Get.height / 18,
                      decoration: BoxDecoration(
                        color: AppConstant.appSecondaryColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          Get.toNamed('/LoginScreen');
                        },
                        label: const Text(
                          "Sign Up",
                          style: TextStyle(color: AppConstant.appTextColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(color: AppConstant.appSecondaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.offAll(SignInScreen());
                        },
                        child: Text(
                          " Sign In",
                          style: TextStyle(
                              color: AppConstant.appSecondaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
