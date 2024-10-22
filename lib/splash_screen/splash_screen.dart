import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/features/onboarding/onboarding_screen/onboarding.dart';
import 'package:habit_tracker/home_page.dart';

import '../core/themes/colors.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(const Duration(seconds: 3), () {
        if (mounted) {
          Navigator.pushReplacementNamed(context, OnboardingScreen.routeName);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           SvgPicture.asset("assets/splashScreen/SplashScreen.svg"),
            Text(
              "Habit Tracker",
              style: GoogleFonts.lato(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor),
            )
          ],
        ),
      ),
    );
  }
}
