import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:habit_tracker/features/onboarding/onboarding_screen/onboarding.dart';
import 'package:habit_tracker/home_page.dart';
import 'package:habit_tracker/splash_screen/splash_screen.dart';

import 'features/cuibt/items_cubit_cubit.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ItemsCubit(),
      child: MaterialApp(
        title: "Habit",
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.routeName,
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomePage.routeName: (context) => const HomePage(),

          OnboardingScreen.routeName : (context) => const OnboardingScreen()

        },
      ),
    ),
  );
}
