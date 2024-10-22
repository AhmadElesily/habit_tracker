import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/features/analysis/analysis_screen.dart';
import 'package:habit_tracker/features/items_task/add_task/add_habit.dart';
import 'package:habit_tracker/features/home/home_layout/home_layout.dart';

import 'core/themes/colors.dart';

class HomePage extends StatefulWidget {
  static String routeName = "home";
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeLayout(),
    const AnalysisScreen(),
  ];

  final List<String> iconNames = ['Home', 'Analysis'];
  final List<bool> iconVisibility = [true, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: tabs[currentIndex],
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: buildFab(),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  Widget buildFab() {
    return FloatingActionButton(
      shape: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.2)),
      elevation: 5,
      backgroundColor: AppColors.primaryColor,
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddHabitItem(),
          ),
        );
      },
      child: const Icon(
        Icons.add_circle_outline,
        color: AppColors.whiteColor,
      ),
    );
  }

  Widget bottomAppBar() {
    double widthSize = MediaQuery.sizeOf(context).width;
    double heightSize = MediaQuery.sizeOf(context).height;
    return BottomAppBar(
      padding: EdgeInsets.symmetric(
          horizontal: widthSize * 0.015, vertical: widthSize * 0.015),
      height: heightSize * 0.09,
      color: AppColors.primaryColor,
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(2, (index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: iconVisibility[index]
                  ? AppColors.customPurple
                  : Colors.transparent,
            ),
            padding: EdgeInsets.only(right: heightSize * 0.0115),
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      iconVisibility.fillRange(0, iconVisibility.length, false);
                      iconVisibility[index] = true;
                    });
                  },
                  child: index == 0
                      ? Padding(
                          padding: EdgeInsets.all(widthSize * 0.0115),
                          child: SvgPicture.asset(
                            "assets/Icons/home-2.svg",
                            width: widthSize * 0.09,
                            color: currentIndex == index
                                ? AppColors.blueColor
                                : AppColors.whiteColor.withOpacity(0.6),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.all(widthSize * 0.0115),
                          child: Icon(
                            Icons.analytics_outlined,
                            size: widthSize * 0.09,
                            color: currentIndex == index
                                ? AppColors.blueColor
                                : AppColors.whiteColor.withOpacity(0.6),
                          ),
                        ),
                ),
                if (iconVisibility[index])
                  Text(iconNames[index],
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, fontSize: 10)),
              ],
            ),
          );
        }),
      ),
    );
  }
}
