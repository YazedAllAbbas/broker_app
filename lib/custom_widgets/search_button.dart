import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            foregroundColor: Constants.KprimaryColor.withOpacity(0.1),
            // minimumSize: const Size.fromHeight(36),
            backgroundColor: Constants.KbackGroundCard,
            elevation: 7,
            shape: BeveledRectangleBorder(
              side:
                  const BorderSide(width: 0.2, color: Constants.KprimaryColor),
              borderRadius: BorderRadius.circular(12),
            )),
        onPressed: () {},
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              color: Constants.KprimaryColor,
              shadows: [
                Shadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(3, 3))
              ],
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              "بحث عن عقار",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo",
                color: Constants.KtitleColor,
                shadows: [
                  Shadow(
                      color: Colors.black12,
                      blurRadius: 6,
                      offset: Offset(3, 3))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
