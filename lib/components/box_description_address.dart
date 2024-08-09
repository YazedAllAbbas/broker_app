import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoxDescriptionAdress extends StatelessWidget {
  BoxDescriptionAdress({required this.descriptionAdrees, super.key});
  TextEditingController descriptionAdrees;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 195,
      margin: const EdgeInsets.only(left: 5, right: 5, top: 3, bottom: 33),
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 7, color: Colors.black26, offset: Offset(0, 0))
          ],
          color: const Color(0xffEFF3F2).withOpacity(0.9),
          borderRadius: BorderRadius.circular(22)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.edit_location_alt,
                  size: 23,
                  color: Constants.KtitleColor,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "قم بكتابة وصف لموقع العقار",
                  style: TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Constants.KprimaryColor,
                  ),
                ),
              ],
            ),
            TextFormField(
              controller: descriptionAdrees,
              maxLines: 5,
              minLines: 5,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
