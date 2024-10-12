import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:habit_tracker/features/calender/calender_Tab.dart';

import '../../core/themes/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    double widthSize = MediaQuery.sizeOf(context).width;
    double heightSize = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(MediaQuery
            .of(context)
            .size
            .height * 0.2),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      body: Column(children: [
        Padding(
          padding: EdgeInsets.only(
            left: widthSize * 0.03,
            right: widthSize * 0.03,
          ),
          child: const CalenderTab(),
        ),
        Expanded(
          child: ListView.builder(
              // physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              itemBuilder: (context, index) {
                return buildHabitCard();
              }),
        ),
      ]),
    );
  }

  Widget buildHabitCard() {
    return Container(
      margin: EdgeInsets.all(
        MediaQuery.sizeOf(context).height * 0.015,
      ),
      color: AppColors.primaryColor,
      child: ListTile(
        title: Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.015,
            ),
            const Icon(Icons.send),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.05,
            ),
            Text(
              "Title",
              style: GoogleFonts.inter(fontSize: 20),
            ),
          ],
        ),
        leading: InkWell(
            onTap: () {
              setState(() {
                isCompleted = !isCompleted;
              });
            },
            child: isCompleted == true
                ? const Icon(Icons.check_circle)
                : const Icon(Icons.circle_outlined)),
      ),
    );
  }
}
