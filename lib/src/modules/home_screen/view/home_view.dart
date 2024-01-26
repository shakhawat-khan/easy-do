import 'package:easy_do/src/constants/app_sizer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('this is home'),
        // ),

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gapH24,
              Text(
                'Hello!',
                style: TextStyle(
                  color: Color(0xFF282B31),
                  fontSize: 24,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              gapH12,
              Text(
                'What\'s your plan for today ?',
                style: TextStyle(
                  color: Color(0xFF979797),
                  fontSize: 14,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              gapH28,
              Text(
                'Task Summary',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF282B31),
                  fontSize: 16,
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
