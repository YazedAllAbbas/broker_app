import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

// ويدجت تعبر عن القائمة المنسدلة من أجل إضافة معلومات وصف العقار

// ignore: must_be_immutable
class DropDownTile extends StatelessWidget {
  DropDownTile({
    super.key,
    this.selectedValue,
    required this.dropdownValueList,
    required this.title,
    required this.dropDownfun,
  });
  //القيمة المختارة من القائمة المنسدلة
  dynamic selectedValue;
  //عنوان بجانب القائمة المنسدلة
  final String title;
  final List<String> dropdownValueList;
  void Function(String?) dropDownfun;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
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
                flex: 6, // Adjust the flex as needed
                child: Theme(
                  data: Theme.of(context).copyWith(
                    inputDecorationTheme: const InputDecorationTheme(
                      errorStyle: TextStyle(
                        fontSize: 0, // حجم الخط للنص الناتج من الـ validator
                      ),
                    ),
                  ),
                  child: DropdownButtonFormField<String>(
                    validator: (value) {
                      if (value == null) {
                        return ""; // نص الخطأ
                      }
                      return null;
                    },
                    borderRadius: BorderRadius.circular(22),
                    // القيمة المختارة من القائمة
                    value: selectedValue,
                    //هذا التابع يستقبل من خلال وسيطه القيمة المختارة من القائمة
                    onChanged: dropDownfun,
                    //العناصر داخل القائمة المنسدلة
                    items: dropdownValueList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        // القيمة المختارة من القائمة
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Constants.KtitleColor),
                        ),
                      );
                    }).toList(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
