import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/colors.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isCompleted = false;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
        itemCount: 15,
        itemBuilder: (context, index) {
          return buildHabitCard();
        });
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
