import 'package:flutter/material.dart';
import 'colors.dart';

void main() {
  runApp(MaterialApp(
    home: homePage(),
  ));
}

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.2),
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(47),
                )),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Hello Ahmed !',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Track your morning habits effortlessly",
                      style: TextStyle(
                        color: Colors.white,
                      ),

                    ),
                    Text(
                      "to stay on top of your daily routine.",
                      style: TextStyle(
                        color: Colors.white,
                      ),

                    ),
                  ],
                ),
              ),
            ),
          )),
      backgroundColor: AppColors.backgroundColor,
    );
  }
}
