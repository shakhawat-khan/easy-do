import 'package:easy_do/src/utils/helpers.dart';
import 'package:easy_do/src/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width * 0.0389, top: 8, bottom: 8),
      child: InkWell(
        onTap: () => context.pop(),
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(90.0),
            boxShadow: const [],
          ),
          child: const Center(
            child: Icon(
              Icons.arrow_back_ios,
              size: 15,
            ),
          ),
        ),
      ),
    );
  }
}
