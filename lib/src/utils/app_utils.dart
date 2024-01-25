import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  ///
  /// email validation
  static bool isValidEmail({required String email}) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  ///
  /// password validation
  static bool isValidPassword({required String password}) {
    if (password.isEmpty || password.length < 6) {
      return false;
    }
    return true;
  }

  ///
  /// error toast
  static void errorToast(
      {required String message, required BuildContext context}) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   gravity: ToastGravity.BOTTOM,
    //   toastLength: Toast.LENGTH_LONG,
    //   textColor: whiteTextColor,
    //   backgroundColor: redBgColor,
    // );
    final snackBar = SnackBar(
      content: Text(message.toString().replaceAll("", '')),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///
  /// success toast
  static void successToast(
      {required String message, required BuildContext context}) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   gravity: ToastGravity.BOTTOM,
    //   toastLength: Toast.LENGTH_LONG,
    //   textColor: whiteTextColor,
    //   backgroundColor: greenBgColor,
    // );
    final snackBar = SnackBar(
      content: Text(message.replaceAll("", '')),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///
  /// general toast
  static void generalToast(
      {required String message, required BuildContext context}) {
    // Fluttertoast.showToast(
    //   msg: message,
    //   gravity: ToastGravity.BOTTOM,
    //   toastLength: Toast.LENGTH_LONG,
    //   textColor: blackTextColor,
    //   backgroundColor: primaryColor,
    // );
    final snackBar = SnackBar(
      content: Text(message.replaceAll("", '')),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  ///
}
