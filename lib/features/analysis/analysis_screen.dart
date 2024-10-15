import 'package:flutter/material.dart';
import 'package:habit_tracker/features/analysis/items_completed/monthly_view.dart';
import 'package:habit_tracker/features/analysis/items_completed/weeklyView.dart';
import 'package:habit_tracker/features/analysis/items_completed/yearly_view.dart';

import '../core/themes/colors.dart';

class AnalysisScreen extends StatefulWidget {
  const AnalysisScreen({super.key});

  @override
  State<AnalysisScreen> createState() => _AnalysisScreenState();
}

class _AnalysisScreenState extends State<AnalysisScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                "Your commitment to your habits.",
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
      body: tabBar(),
    );
  }

  Widget tabBar() {
    double heightSize = MediaQuery.sizeOf(context).height;
    double widthSize = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: heightSize*0.015, vertical: widthSize*0.03),
          child: Container(
            color: Colors.grey[900],
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.primaryColor,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.all(widthSize * 0.015),
              labelColor: AppColors.textColor,
              unselectedLabelColor: AppColors.whiteColor,
              dividerColor: Colors.transparent,
              tabs: const [
                Tab(text: 'Weekly',),
                Tab(text: 'Monthly'),
                Tab(text: 'Yearly'),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              WeeklyView(),
              MonthlyView(),
              YearlyView(),
            ],
          ),
        ),
      ],
    );
  }
}


