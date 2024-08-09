import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class RealEstateFeature extends StatelessWidget {
  final String title;
  final String value;
  const RealEstateFeature(
      {super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.adjust_outlined,
                size: 18,
                color: Constants.KprimaryColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: const TextStyle(
                    shadows: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black26,
                          offset: Offset(0, 0))
                    ],
                    fontFamily: "Cairo",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Constants.KtitleColor),
              ),
              const Spacer(
                flex: 3,
              ),
              Text(
                value,
                style: const TextStyle(
                    fontFamily: "Cairo",
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Constants.KprimaryColor),
              ),
              const SizedBox(
                width: 40,
              ),
            ],
          ),
          const Divider(
            thickness: 0.3,
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
