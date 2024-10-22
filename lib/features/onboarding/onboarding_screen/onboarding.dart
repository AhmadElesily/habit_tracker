import 'package:flutter/material.dart';
import 'package:habit_tracker/home_page.dart';

import '../../../core/themes/colors.dart';
import '../onboarding-page.dart';

class OnboardingScreen extends StatefulWidget {
  static String routeName = "onboarding";

  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          child: PageView(
            onPageChanged: (value) {
              setState(() {
                index = value;
              });
            },
            controller: controller,
            children: const [
              OnBoardingPage(
                image: "assets/onboarding/onboarding 1.svg",
                title: "Track your habits easier!",
                description:
                    "Replace your habit journaling manually with the Create Your Habits app to easily track your habits",
              ),
              OnBoardingPage(
                image: "assets/onboarding/onboarding 2.svg",
                title: "Start your day right",
                description:
                    "Record your habits to start your day with intention and set yourself up for success throughout the day",
              ),
              // SizedBox(
              //   height: 500,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       SizedBox(
              //         height: MediaQuery.sizeOf(context).height * 0.3,
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             const Text(
              //               textAlign: TextAlign.center,
              //               "Start your day right",
              //               style: TextStyle(
              //                   fontWeight: FontWeight.w600,
              //                   fontSize: 25,
              //                   color: AppColors.blueColor),
              //             ),
              //             Padding(
              //               padding: EdgeInsets.only(
              //                   right: MediaQuery.sizeOf(context).width * 0.07,
              //                   left: MediaQuery.sizeOf(context).width * 0.07),
              //               child: const Text(
              //                   textAlign: TextAlign.center,
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.w400, fontSize: 18),
              //                   "Record your habits to start your day with intention and set yourself up for success throughout the day"),
              //             ),
              //           ],
              //         ),
              //       ),
              //       Container(
              //         decoration: const BoxDecoration(
              //           borderRadius: BorderRadius.only(
              //             topLeft: Radius.circular(20),
              //             topRight: Radius.circular(20),
              //           ),
              //           color: AppColors.primaryColor,
              //         ),
              //         width: MediaQuery.sizeOf(context).width * 1.0,
              //         height: MediaQuery.sizeOf(context).height * 0.5,
              //         child: SvgPicture.asset(
              //           "assets/onboarding/onboarding 2.svg",
              //           // width: MediaQuery.sizeOf(context).width * 0.6,
              //           // height: MediaQuery.sizeOf(context).height * 0.5,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              OnBoardingPage(
                title: "Start your day right",
                image: "assets/onboarding/onboarding 3.svg",
                description:
                    "Record your habits to start your day with intention and set yourself up for success throughout the day",
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomIndicator(inActive: index == 0),
            const SizedBox(
              width: 5,
            ),
            CustomIndicator(inActive: index == 1),
            const SizedBox(
              width: 5,
            ),
            CustomIndicator(inActive: index == 2),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.animateToPage(
                    index = 2,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                onTap: () {
                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  } else {
                    controller.animateToPage(
                      index + 1,
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.linear,
                    );
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Text(
                    (index == 2) ? "Start" : "Next",
                    style:  const TextStyle(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    )
        // onBoardingNavigation(context)
        );
  }
}

class CustomIndicator extends StatelessWidget {
  final bool inActive;

  const CustomIndicator({super.key, required this.inActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color:
              inActive ? AppColors.primaryColor : AppColors.greyColor),
      width: inActive ? 30 : 10,
      height: 10,
    );
  }
}
