import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class MonthlyView extends StatelessWidget {
  const MonthlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Monthly",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
