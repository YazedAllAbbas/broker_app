import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomTextFiledWithTitle extends StatelessWidget {
  const CustomTextFiledWithTitle({
    super.key,
    required this.controller,
    required this.title,
    required this.textInputType,
  });
  final String title;
  final TextInputType textInputType;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.filter_tilt_shift_rounded,
            size: 13,
            color: Constants.KtitleColor,
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  color: Constants.KprimaryColor,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Expanded(
            flex: 6,
            child: CustomTextFieldToAddFeatures(
              controller: controller,
              inputkeyboardType: textInputType,
            ), // Adjust the flex as needed
          ),
        ],
      ),
    );
  }
}
