import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walle/services/services_constants.dart';
import '../../constants/constants.dart';
import '../views.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;

  void splashScreen() {
    if (user != null) {
      timer = Timer(const Duration(seconds: 2), () {
        Get.off(() => const HomeView());
      });
    } else {
      timer = Timer(const Duration(seconds: 2), () {
        Get.off(() => const SignInView());
      });
    }
  }

  @override
  void initState() {
    super.initState();
    splashScreen();
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(walle, height: 80)),
    );
  }
}
