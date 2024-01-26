import 'package:easy_do/src/utils/helpers.dart';
import 'package:flutter/material.dart';

class TaskCounter extends StatelessWidget {
  final String state;
  final String assetPath;
  final String number;
  const TaskCounter({
    super.key,
    required this.state,
    required this.assetPath,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 163,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(assetPath),
            ),
          ),
        ),
        Positioned(
          top: 33,
          left: 14,
          child: Text(
            state,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFF282B31),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        Positioned(
          top: 60,
          left: 14,
          child: Text(
            number,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        )
      ],
    );
  }
}
