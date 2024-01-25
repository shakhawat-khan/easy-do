import 'package:easy_do/src/utils/helpers.dart';
import 'package:flutter/material.dart';

class SIgnInTopBar extends StatelessWidget {
  const SIgnInTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 180,
      decoration: ShapeDecoration(
        image: DecorationImage(
          image: AssetImage(Helpers.splashColor),
          fit: BoxFit.fill,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
        ),
      ),
      child: Center(
        child: SizedBox(
          height: 80,
          width: 80,
          child: Image(
            fit: BoxFit.contain,
            image: AssetImage(
              Helpers.splashLogo,
            ),
          ),
        ),
      ),
    );
  }
}
