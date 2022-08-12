// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../HomeScreen/homePage.dart';
import '../perfstring.dart';

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
    Timer(Duration(seconds: 1), () async {
      SharedPreferences pref = await SharedPreferences.getInstance();
      status = pref.getString(PrefString.loggedIn);
      // Utility.isFirstTime = pref.getString(PrefString.firstTimeUser);

      print('status $status');

      if (status == 'loggedIn') {
        Get.offAll(HomePage());
      } else {
        // Get.offAll(() => SignUpScreen(sign: true));
        return;
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
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              maxRadius: 5,
              backgroundColor: Colors.blueGrey,
            ),
          ],
        ),
      ),
    );
  }
}
