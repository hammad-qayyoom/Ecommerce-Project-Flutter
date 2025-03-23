import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenage_ecomm/screens/auth-ui/sign-up-screen.dart';
import 'package:greenage_ecomm/screens/auth-ui/splash-screen.dart';
import 'package:greenage_ecomm/screens/user-panel/main-screen.dart';

import 'screens/auth-ui/sign-in-screen.dart';
import 'screens/auth-ui/welcome-screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const SignUpScreen()),
        GetPage(name: '/SignInScreen', page: () => const SignInScreen()),
        GetPage(name: '/SplashScreen', page: () => const SplashScreen()),
        GetPage(name: '/WelcomeScreen', page: () => const WelcomeScreen()),
        GetPage(name: '/MainScreen', page: () => const MainScreen()), // Ensure this route is registered
      ],
    );
  }
}
