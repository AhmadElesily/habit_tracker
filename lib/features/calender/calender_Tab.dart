import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../core/themes/colors.dart';

class CalenderTab extends StatelessWidget { // Changed to StatelessWidget
  const CalenderTab({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime focusedDate = DateTime.now();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.transparent,
      ),
      height: MediaQuery.of(context).size.height * 0.12, // Optional, remove if using Expanded
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column( // Wrap in Column to use Expanded
          children: [
            Expanded( // Use Expanded to avoid overflow
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
                    color: AppColors.whiteColor,
                    shape: BoxShape.rectangle,
                  ),
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: AppColors.whiteColor),
                  weekendStyle: TextStyle(color: AppColors.buttonColor),
                ),
                firstDay: DateTime.now().subtract(const Duration(days: 365)),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                focusedDay: focusedDate,
                currentDay: focusedDate,
                calendarFormat: CalendarFormat.week,
                availableCalendarFormats: const {
                  CalendarFormat.week: 'Week',
                },
                onDaySelected: (selectedDate, focusedDate) {
                  // Update focused date if necessary
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
