import 'package:flutter/material.dart';

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
          preferredSize: Size.fromHeight(144),
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xff6959D6),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(40),
                )),
            child: AppBar(
              backgroundColor: Colors.transparent,
              title: Container(
                width: double.infinity,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10,),
                    Text(
                      '! مساء الخير احمد',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 24
                      ),
                    ),
                    Text(
                      'تتبع عاداتك الصباحية',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MontserratLight',
                          fontSize: 16
                      ),
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          )),
      backgroundColor: Color(0xff151515),
    );
  }
}