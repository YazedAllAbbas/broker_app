import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class BoxAdditionalFeaturesWidget extends StatelessWidget {
  const BoxAdditionalFeaturesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 25),
      height: 210,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 7, color: Colors.black26, offset: Offset(0, 0))
          ],
          color: const Color(0xffEFF3F2).withOpacity(0.9),
          borderRadius: BorderRadius.circular(22)),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.add,
                  color: Constants.KtitleColor,
                  size: 25,
                ),
                Text(
                  "ميزات إضافية",
                  style: TextStyle(
                      fontFamily: "Cairo",
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Constants.KprimaryColor),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            // AdditionalFeaturesWidget(),
          ],
        ),
      ),
    );
  }
}
