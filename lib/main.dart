import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'features/DetailsScreen/screens/DetailsScreen.dart';
import 'features/HomePage/screens/HomeScreen.dart';
import 'features/SplashScreen/screens/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        title: 'Netflix',
        getPages: [
          GetPage(name: '/details', page: () => DetailsScreen()), // Details Screen
        ],
        home: const SplashScreen());
  }
  }




