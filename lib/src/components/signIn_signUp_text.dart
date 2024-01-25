import 'package:flutter/material.dart';

class SignInTextTitelComponent extends StatelessWidget {
  final String name;
  const SignInTextTitelComponent({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
