import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../colors.dart';

class CalenderTab extends StatefulWidget {
  const CalenderTab({super.key});

  @override
  State<CalenderTab> createState() => _CalenderTabState();
}

class _CalenderTabState extends State<CalenderTab> {
  DateTime _focusedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      height: MediaQuery.sizeOf(context).height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TableCalendar(
          headerVisible: false,
          calendarStyle: const CalendarStyle(
            defaultTextStyle: TextStyle(color: Colors.white),
            weekendTextStyle: TextStyle(color: AppColors.buttonColor),
            todayDecoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.rectangle,
            ),
            selectedDecoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.rectangle,
            ),
          ),
          daysOfWeekStyle: const DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: AppColors.lightGrey),
            weekendStyle: TextStyle(color: AppColors.buttonColor),
          ),
          // headerStyle: const HeaderStyle(
          //   titleTextStyle: TextStyle(color: AppColors.lightGrey, fontSize: 20),
          //   leftChevronIcon: Icon(
          //     Icons.chevron_left,
          //     color: AppColors.lightGrey,
          //   ),
          //   rightChevronIcon: Icon(
          //     Icons.chevron_right,
          //     color:AppColors.lightGrey,
          //   ),
          // ),
          firstDay: DateTime.now().subtract(const Duration(days: 365)),
          lastDay: DateTime.now().add(const Duration(days: 365)),
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
        ),

      ),
    );
  }
}