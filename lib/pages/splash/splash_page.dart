import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travelerapp/pages/auth/login.dart';
import 'package:travelerapp/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {

  late Animation<double> animation;
  late AnimationController controller;

  late SharedPreferences prefs;

  initShared() async {
    final prefs = await SharedPreferences.getInstance();
  }


  @override
  void initState() {
    initShared();



    super.initState();
    controller = new AnimationController(
        vsync: this, duration: const Duration(seconds: 3))
      ..forward();
    //   animation = new AnimationController(vsync: this,du)
    //  (parent: controller, curve: Curves.bounceOut);

    Timer(Duration(seconds: 3), () {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) =>  Login()),
            (route) => false);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.purpleColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Stack(
              children: [
                RotationTransition(
                  alignment: Alignment.center,
                  turns: controller,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Container(
                          height: 0.5.sw,
                          width: 0.5.sw,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/image/rotatedSplash.png',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 0.5.sw,
                      width: 0.5.sw,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/image/splash 1.png',
                              ),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
