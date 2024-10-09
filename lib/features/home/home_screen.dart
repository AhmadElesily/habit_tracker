import 'package:flutter/material.dart';
import 'package:habit_tracker/features/core/colors.dart';

class HomePage extends StatelessWidget {
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
    );
  }
}
