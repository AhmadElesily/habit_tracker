import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/themes/colors.dart';
import '../../cuibt/items_cubit_cubit.dart';
import '../../cuibt/items_cubit_state.dart';

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
    return buildMonthlyView();
  }

  Widget buildMonthlyView() {
    return BlocBuilder<ItemsCubit, ItemsState>(
      builder: (context, state) {
        if (state is ItemsSucceed) {
          if (state.items.isEmpty){
            return const Center(
              child: Text(
                'No habits found',
                style: TextStyle(fontSize: 24, color: AppColors.whiteColor),
              ),
            );
          }
          return ListView.builder(
            itemCount: state.items.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.019),
              child: Container(
                padding:
                    EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.02),
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
                                    fontSize: 20, color: AppColors.whiteColor),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                "16",
                                style: TextStyle(
                                    fontSize: 24, color: AppColors.whiteColor),
                              ),
                              Text(
                                "/30",
                                style: TextStyle(
                                    fontSize: 16, color: AppColors.whiteColor),
                              ),
                            ],
                          )
                        ],
                      ),

                          // child:SizedBox(
                          //   width: MediaQuery.sizeOf(context).width * 0.057,
                          //   height: MediaQuery.sizeOf(context).height * 0.027,
                          // ),
                        ),
                    const Divider(),
                    Wrap(
                      spacing: MediaQuery.sizeOf(context).width * 0.019,
                      runSpacing: MediaQuery.sizeOf(context).height * 0.006,
                      children: List.generate(
                        days.length,
                        (index2) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedDays[index2] =
                                    !selectedDays[index2];
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  days[index2].toString(),
                                  style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.whiteColor),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.006,
                                ),
                                Container(
                                  padding: EdgeInsets.all(
                                    MediaQuery.sizeOf(context).width * 0.02,
                                  ),
                                  decoration: BoxDecoration(
                                    color: selectedDays[index2]
                                        ? AppColors.blueColor
                                        : state.items[index].color,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: SizedBox(
                                    width: MediaQuery.sizeOf(context).width *
                                        0.057,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.027,
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ])
                ),
              ),
            );
        } else {
          return const Center(
            child: Text("No Items Selected",style: TextStyle(
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w400,
              fontSize: 20,
            ),),
          );
        }
      },
    );
  }
}
