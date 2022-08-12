// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/HomeScreen/homePage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? status;

  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() {
    Timer(Duration(seconds: 2), () async {
      // SharedPreferences pref = await SharedPreferences.getInstance();
      // status = pref.getString(PrefString.loggedIn);
      // Utility.isFirstTime = pref.getString(PrefString.firstTimeUser);

      print('status $status');

      if (status == 'loggedIn') {
        Get.offAll(HomePage());
      } else {
        // Get.offAll(() => SignUpScreen(sign: true));
        // Get.offAll(() => SignUpScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("asset/splash.png"), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
