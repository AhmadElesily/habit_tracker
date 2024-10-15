import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';



class MonthlyView extends StatefulWidget {
  const MonthlyView({super.key});

  @override
  State<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView> {
  List<bool> selectedDays = List.generate(31, (index) => false);
  List<int> days = List.generate(31, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) => buildMonthlyView(),
    );
  }

  Widget buildMonthlyView() {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.019),
      child: Container(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
        color: AppColors.primaryColor,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:3.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "🌿",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.019,
                      ),
                      const Text(
                        "Items",
                        style: TextStyle(fontSize: 20, color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "16",
                        style: TextStyle(
                          fontSize: 24,
                          color: AppColors.whiteColor
                        ),
                      ),
                      Text(
                        "/30",
                        style: TextStyle(
                            fontSize: 16,
                            color: AppColors.whiteColor
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(),
            Wrap(
              spacing: MediaQuery.sizeOf(context).width * 0.019,
              runSpacing: MediaQuery.sizeOf(context).height * 0.006,
              children: List.generate(
                days.length,
                    (index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedDays[index] = !selectedDays[index]; // تبديل حالة التحديد
                      });
                    },
                    child: Column(
                      children: [
                        Text(
                          days[index].toString(),
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.whiteColor),
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
                            size: 21,
                          )
                              : SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.057,
                            height: MediaQuery.sizeOf(context).height * 0.027,
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


