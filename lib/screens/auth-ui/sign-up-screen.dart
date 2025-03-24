// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:greenage_ecomm/controllers/sign-up-controller.dart';
import '../../utils/app-constant.dart';
import 'sign-in-screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (context, isKeyboardVisible) {
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
            child: Column(
              children: [
                SizedBox(height: Get.height / 20),
                Text(
                  "Welcome to My App",
                  style: TextStyle(
                    color: AppConstant.appSecondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: Get.height / 20),

                /// Email Input
                buildTextField(userEmail, "Email", Icons.email, TextInputType.emailAddress),

                /// Username Input
                buildTextField(userName, "Username", Icons.person, TextInputType.name),

                /// Phone Input
                buildTextField(userPhone, "Phone Number", Icons.phone, TextInputType.phone),

                /// City Input
                buildTextField(userCity, "City", Icons.location_city, TextInputType.text),

                /// Password Input with Obx for visibility toggle
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Obx(
                          () => TextField(
                        controller: userPassword,
                        obscureText: signUpController.isPasswordVisible.value,
                        cursorColor: AppConstant.appSecondaryColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password, color: AppConstant.appSecondaryColor),
                          suffixIcon: GestureDetector(
                            onTap: () => signUpController.isPasswordVisible.toggle(),
                            child: Icon(
                              signUpController.isPasswordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: AppConstant.appSecondaryColor),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: Get.height / 20),

                /// Sign Up Button
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
                        String name = userName.text.trim();
                        String email = userEmail.text.trim();
                        String phone = userPhone.text.trim();
                        String city = userCity.text.trim();
                        String password = userPassword.text.trim();
                        String userDeviceToken = ''; // Consider adding a valid device token

                        if (name.isEmpty || email.isEmpty || phone.isEmpty || city.isEmpty || password.isEmpty) {
                          Get.snackbar(
                            "Error", "Please fill all the fields",
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: AppConstant.appSecondaryColor,
                            colorText: AppConstant.appTextColor,
                          );
                        } else {
                          UserCredential? userCredential = await signUpController.signUpMethod(
                            name, email, phone, city, password, userDeviceToken,
                          );

                          if (userCredential != null) {
                            Get.snackbar(
                              "Verification Email Sent",
                              "Please Check Your Email",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppConstant.appSecondaryColor,
                              colorText: AppConstant.appTextColor,
                            );
                            FirebaseAuth.instance.signOut();
                            Get.offAll(SignInScreen());
                          }
                        }
                      },
                      label: Text("Sign Up", style: TextStyle(color: AppConstant.appTextColor)),
                    ),
                  ),
                ),

                SizedBox(height: Get.height / 20),

                /// Already have an account? Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account?", style: TextStyle(color: AppConstant.appSecondaryColor)),
                    GestureDetector(
                      onTap: () => Get.offAll(SignInScreen()),
                      child: Text(
                        " Sign In",
                        style: TextStyle(color: AppConstant.appSecondaryColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Helper function to create text fields
  Widget buildTextField(TextEditingController controller, String hint, IconData icon, TextInputType inputType) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: controller,
          cursorColor: AppConstant.appSecondaryColor,
          keyboardType: inputType,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: AppConstant.appSecondaryColor),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
            hintText: hint,
            hintStyle: TextStyle(color: AppConstant.appSecondaryColor),
          ),
        ),
      ),
    );
  }
}
