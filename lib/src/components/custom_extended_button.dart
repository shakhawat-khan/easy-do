import 'package:easy_do/src/utils/hex_color.dart';
import 'package:flutter/material.dart';

class CusomExtendedButton extends StatelessWidget {
  final Widget state;
  const CusomExtendedButton({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          14,
        ),
        color: HexColor(
          '#8C88CD',
        ),
      ),
      child: Center(child: state),
    );
  }
}
