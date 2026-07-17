import 'package:flutter/material.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/details/sura_details1_screen.dart';
import 'package:islami_app/ui/home/tabs/quran/details/sura_details_screen.dart';
import 'package:islami_app/ui/on_boarding/on_boarding_screen.dart';
import 'package:islami_app/utils/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onBoardingRouteName: (context) => OnBoardingPage(),
        AppRoutes.suraDetailsRouteName: (context) => SuraDetailsScreen(),
        AppRoutes.suraDetails1RouteName: (context) => SuraDetails1Screen(),
      },
    );
  }
}
