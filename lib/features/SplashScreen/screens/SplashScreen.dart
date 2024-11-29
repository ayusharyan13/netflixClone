import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix/features/SearchPage/screens/SearchScreen.dart';
import 'package:netflix/features/SplashScreen/Controller/SplashController.dart';
import '../../../Navigation/BottomNavigation.dart';
import '../../HomePage/screens/HomeScreen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController splashController = SplashController();
  @override



  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      Get.off(() => const NavigationExample());
    });
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logo/logos_netflix.png",
                width: MediaQuery.of(context).size.width/1.4,
                height: 200),
          ],
        ),
      ),
    );
  }
}







