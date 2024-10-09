import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:habit_tracker/features/core/colors.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.sizeOf(context).height;
    double widthSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(47),
            ),
          ),
          padding: EdgeInsets.only(
              left: widthSize * 0.05,
              top: heightSize * 0.02,
              bottom: heightSize * 0.05),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Hello Ahmed !',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "Track your morning habits effortlessly to stay on top of your daily routine.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primaryColor,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: IconThemeData(
            size: widthSize * 0.09,
          ),
          unselectedIconTheme: IconThemeData(
            size: widthSize * 0.07,
          ),
          currentIndex: currentIndex,
          iconSize: 10,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.whiteColor,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: currentIndex == 0
                      ? AppColors.customPurple
                      : AppColors.whiteColor,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.analytics_outlined,
                  color: currentIndex == 0
                      ? AppColors.whiteColor
                      : AppColors.customPurple,
                ),
                label: "Analysis"),
          ]),
    );
  }
}
