import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/themes/colors.dart';


class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.primaryColor,
          ),
          width: MediaQuery.sizeOf(context).width * 1.0,
          height: MediaQuery.sizeOf(context).height * 0.5,
          child: SvgPicture.asset(
            image,
            width: MediaQuery.sizeOf(context).width * 0.6,
            height: MediaQuery.sizeOf(context).height * 0.5,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.1,
        ),
        Text(
          textAlign: TextAlign.center,
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: AppColors.blueColor),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.04,
        ),
        Padding(
          padding: EdgeInsets.only(
              right: MediaQuery.sizeOf(context).width * 0.07,
              left: MediaQuery.sizeOf(context).width * 0.07),
          child:  Text(
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18,),
              description),
        ),
      ],
    );
  }
}