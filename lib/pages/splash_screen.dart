import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie_api/utils/app_colors.dart';
import 'package:get/get.dart';

import '../routes/route_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(seconds: 2))..forward();

    animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    Timer(
      const Duration(seconds: 3), () => Get.offNamed(RouteHelper.getInitial())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: ScaleTransition(
        scale: animation,
        child: Center(
          child: Image.asset('assets/images/logo.png',
          width: MediaQuery.of(context).size.width * 0.59,
          ),
        ),
      )
    );
  }
}
