
import 'package:flutter/material.dart';

import '../../core/themes/colors.dart';

class YearlyView extends StatelessWidget {
  const YearlyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Yearly",
        style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}