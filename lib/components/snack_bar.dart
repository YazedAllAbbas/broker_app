import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  // دالة لإظهار SnackBar مع رسالة مخصصة
  static void showSnackBar(
      BuildContext context, String messageContent, bool isPrimary) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            isPrimary ? Constants.KprimaryColor : Constants.KtitleColor,
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 80),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        content: Text(
          messageContent,
          style: const TextStyle(
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
