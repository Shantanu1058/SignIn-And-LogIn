import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_and_login/screens/home_page.dart';

import 'screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? isUserLogIn = false;
  getUserLogInState() async {
    await SharedPreferences.getInstance().then((value) {
      setState(() {
        isUserLogIn = value.getBool("isAuth");
      });
    });
  }

  @override
  void initState() {
    getUserLogInState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SignIn And LogIn',
      theme:
          ThemeData(primaryColor: Colors.blue, backgroundColor: Colors.white),
      home: isUserLogIn != null
          ? isUserLogIn == true
              ? const HomePage()
              : const SignInScreen()
          : const SignInScreen(),
    );
  }
}
