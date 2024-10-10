import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habit_tracker/features/analysis/analysis_screen.dart';
import 'package:habit_tracker/features/core/themes/colors.dart';
import 'package:habit_tracker/features/home/home_layout/home_layout.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _focusedDate = DateTime.now();
  int currentIndex = 0;
  List<Widget> tabs = [
    const HomeLayout(),
    const AnalysisScreen(),
  ];

  final List<String> iconNames = ['Home', 'Analysis'];
  final List<bool> iconVisibility = [false, false];

  @override
  Widget build(BuildContext context) {
    double heightSize = MediaQuery.sizeOf(context).height;
    double widthSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            calendarWidget(),
            tabs[currentIndex],
          ],
        ),
      ),
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: buildFab(heightSize * 0.4),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  Widget buildFab(double height) {
    return FloatingActionButton(
      shape: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(MediaQuery.sizeOf(context).width * 0.2)),
      elevation: 5,
      backgroundColor: AppColors.primaryColor,
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: height,
              color: Colors.red,
            );
          },
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
                IconButton(
                  iconSize: widthSize * 0.09,
                  icon: Icon(
                    index == 0 ? Icons.home_outlined : Icons.analytics_outlined,
                    color: currentIndex == index
                        ? AppColors.blueColor
                        : AppColors.whiteColor.withOpacity(0.6),
                  ),
                  onPressed: () {
                    setState(() {
                      currentIndex = index;
                      iconVisibility.fillRange(0, iconVisibility.length, false);
                      iconVisibility[index] = true;
                    });
                  },
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

  Widget calendarWidget() {
    return Container(
      decoration: const BoxDecoration(color: AppColors.backgroundColor),
      height: 150,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TableCalendar(
              calendarStyle:   const CalendarStyle(
                defaultTextStyle: TextStyle(color: Colors.white),
                weekendTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekdayStyle: TextStyle(color: AppColors.primaryColor),
                weekendStyle: TextStyle(color: AppColors.primaryColor),
              ),
              headerStyle: const HeaderStyle(
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: AppColors.primaryColor,
                ),
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color:AppColors.primaryColor,
                ),
              ),
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDate,
              currentDay: _focusedDate,
              calendarFormat: CalendarFormat.week,
              availableCalendarFormats: const {
                CalendarFormat.week: 'Week',
              },
              onDaySelected: (selectedDate, focusedDate) {
                setState(() {
                  _focusedDate = focusedDate;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}