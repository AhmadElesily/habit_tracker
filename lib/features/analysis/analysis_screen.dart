import 'package:flutter/material.dart';

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
    _tabController = TabController(
        length: 3,
        vsync: this); // تأكد من أن طول الـ TabController يطابق عدد الـ Tabs
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
      body: tabBar(),
    );
  }

  Widget tabBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: Container(
            color: Colors.grey[800],
            child: TabBar(
              controller: _tabController,
              labelColor: AppColors.whiteColor,
              unselectedLabelColor: AppColors.textColor,
              tabs: const [
                Tab(
                  text: 'Weekly',
                ),
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
              // Weekly View
              WeeklyView(),
              // Monthly View
              MonthlyView(),
              // Yearly View - يمكن إضافة كود مماثل إذا كنت تخطط لإظهار عادات سنوية
              YearlyView(),
            ],
          ),
        ),
      ],
    );
  }
}

class WeeklyView extends StatelessWidget {
  const WeeklyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Weakly",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class MonthlyView extends StatelessWidget {
  const MonthlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Monthly",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class YearlyView extends StatelessWidget {
  const YearlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Yearly",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
    );
  }
}
