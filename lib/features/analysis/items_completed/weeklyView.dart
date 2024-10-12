import 'package:flutter/material.dart';
import 'package:habit_tracker/features/core/themes/colors.dart';

class WeeklyView extends StatefulWidget {
  const WeeklyView({super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView> {

  List<bool> selectedDays = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  List<String> days = [
    "Sun",
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => buildWeeklyView(),
    );
  }

  Widget buildWeeklyView() {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.019),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width*0.02),
        // height: 20,
        color: AppColors.primaryColor,
        child: Column(
          children: [
             Row(
              children: [
                const Text(
                  "🌿",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width*0.019,
                ),
                const Text(
                  "Items",
                  style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                days.length,
                (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedDays[index] =
                            !selectedDays[index]; // Toggle selection
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          days[index],
                          style: const TextStyle(
                              fontSize: 15, color: AppColors.whiteColor),
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.006,
                        ),
                        Container(
                          padding: EdgeInsets.all(
                            MediaQuery.sizeOf(context).width * 0.02,
                          ),
                          decoration: BoxDecoration(
                            color: selectedDays[index]
                                ? AppColors.mediumBlue
                                : Colors.purple[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: selectedDays[index]
                              ? const Icon(
                                  Icons.check_circle,
                                  color: AppColors.whiteColor,
                                )
                              : SizedBox(
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.057,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.027,
                                ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
