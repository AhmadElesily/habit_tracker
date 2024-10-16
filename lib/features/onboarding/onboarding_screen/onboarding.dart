import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/features/core/themes/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../onboarding-page.dart';

class OnboardingScreen extends StatelessWidget {
  static String routeName = "onboarding";

  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              const OnBoardingPage(
                image: "assets/onboarding/onboarding 1.svg",
                title: "Track your habits easier!",
                description:
                    "Replace your habit journaling manually with the Create Your Habits app to easily track your habits",
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          textAlign: TextAlign.center,
                          "Start your day right",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25,
                              color: AppColors.blueColor),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.sizeOf(context).width * 0.07,
                              left: MediaQuery.sizeOf(context).width * 0.07),
                          child: const Text(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                              "Record your habits to start your day with intention and set yourself up for success throughout the day"),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    child: SvgPicture.asset(
                      "assets/onboarding/onboarding 2.svg",
                      // width: MediaQuery.sizeOf(context).width * 0.6,
                      // height: MediaQuery.sizeOf(context).height * 0.5,
                    ),
                  ),
                ],
              ),
              const OnBoardingPage(
                title: "Start your day right",
                image: "assets/onboarding/onboarding 3.svg",
                description:
                    "Record your habits to start your day with intention and set yourself up for success throughout the day",
              )
            ],
          ),
          onBoardingNavigation(context)
        ],
      ),
    );
  }

  Widget onBoardingNavigation(BuildContext context) {
    return Positioned(
          bottom: MediaQuery.sizeOf(context).height*0.05 + 25,
            left: MediaQuery.sizeOf(context).width*0.4,
            child: SmoothPageIndicator(controller: PageController(), count: 3,
              effect:const ExpandingDotsEffect(activeDotColor: AppColors.blueColor,dotHeight: 6) ,));
  }
}
