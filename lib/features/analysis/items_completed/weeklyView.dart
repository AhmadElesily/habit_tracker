import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/cubit/items_cubit_cubit.dart';

import '../../../core/themes/colors.dart';
import '../../cubit/items_cubit_state.dart';

class WeeklyView extends StatefulWidget {
  const WeeklyView({super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}
class _WeeklyViewState extends State<WeeklyView> {

  List<List<bool>> selectedDays = [];

  List<String> days = [
    "Mon",
    "Tue",
    "Wed",
    "Thu",
    "Fri",
    "Sat",
    "Sun",
  ];

  @override
  Widget build(BuildContext context) {
    return buildWeeklyView();
  }

  Widget buildWeeklyView() {
    return BlocBuilder<ItemsCubit, ItemsState>(
      builder: (context, state) {
        if (state is ItemsSucceed) {
          if (state.items.isEmpty) {
            return const Center(
              child: Text(
                'No habits found For This Week',
                style: TextStyle(fontSize: 24, color: AppColors.whiteColor),
              ),
            );
          }

          if (selectedDays.length != state.items.length) {
            selectedDays = List.generate(
              state.items.length,
                  (index) => List.generate(days.length, (index2) => false),
            );
          }
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index)

            => Padding(
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.019),
              child: Container(
                padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
                color: AppColors.primaryColor,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              state.items[index].iconImage,
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.019,
                              ),
                              Text(
                                state.items[index].text,
                                style: const TextStyle(
                                    fontSize: 20,
                                    color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                           Row(
                            children: [
                              Text(
                                "${selectedDays[index].where((day) => day == true).length}",
                                style: const TextStyle(
                                    fontSize: 24, color: AppColors.whiteColor),
                              ),
                              const Text(
                                "/7",
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.whiteColor),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        days.length,
                            (index2) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedDays[index][index2] =
                                !selectedDays[index][index2];
                                state.items[index].isSelected =
                                !state.items[index].isSelected;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  days[index2],
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: AppColors.whiteColor),
                                ),
                                SizedBox(
                                  height: MediaQuery.sizeOf(context).height *
                                      0.006,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                    MediaQuery.sizeOf(context).width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedDays[index][index2]
                                        ? state.items[index].color
                                        : state.items[index].color
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: selectedDays[index][index2]
                                      ? const Icon(
                                    Icons.check_circle,
                                    color: AppColors.whiteColor,
                                    size: 21,
                                  )
                                      : SizedBox(
                                    width: MediaQuery.sizeOf(context)
                                        .width *
                                        0.0518,
                                    height: MediaQuery.sizeOf(context)
                                        .height *
                                        0.023,
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
            ),
          );
        } else {
          return const Center(
            child: Text(
              "No Items Founded",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 20,
              ),
            ),
          );
        }
      },
    );
  }
}
