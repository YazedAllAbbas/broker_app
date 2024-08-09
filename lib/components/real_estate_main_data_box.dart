import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class RealEstateMainDataBox extends StatelessWidget {
  const RealEstateMainDataBox(
      {super.key,
      required this.category,
      required this.type,
      required this.area,
      required this.city,
      required this.region,
      required this.price,
      required this.descriptionAdrees});
  final String type;
  final String area;
  final String city;
  final String region;
  final String price;
  final String category;
  final String descriptionAdrees;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      area,
                      style: const TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Text(
                      "متر مربع",
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 10,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place_outlined,
                      color: Constants.KprimaryColor,
                      size: 17,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    Text(
                      city,
                      style: const TextStyle(
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    const Text(" _ ",
                        style: TextStyle(
                            color: Constants.KtitleColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold,
                            fontSize: 13)),
                    Text(region,
                        style: const TextStyle(
                            color: Constants.KtitleColor,
                            fontFamily: "Cairo",
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                  ],
                )
              ],
            ),
            const Spacer(),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 7,
                            color: Colors.black26,
                            offset: Offset(0, 0))
                      ],
                      color: const Color(0xffEFF3F2).withOpacity(0.9),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      )),
                  child: Text(
                    category,
                    style: const TextStyle(
                        shadows: [
                          BoxShadow(
                              blurRadius: 10,
                              color: Colors.black26,
                              offset: Offset(0, 0))
                        ],
                        color: Constants.KprimaryColor,
                        fontFamily: "Cairo",
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Row(
                  children: [
                    Text(
                      "200",
                      style: TextStyle(
                          fontFamily: "cairo",
                          fontSize: 17,
                          color: Constants.KtitleColor),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Constants.KprimaryColor,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Padding(
          padding:
              const EdgeInsets.only(right: 20, bottom: 20, left: 10, top: 5),
          child: Text(
            descriptionAdrees,
            style: const TextStyle(shadows: [
              BoxShadow(
                  blurRadius: 10, color: Colors.black12, offset: Offset(0, 0))
            ], fontFamily: "Cairo", fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        Row(
          children: [
            const SizedBox(
              width: 22,
            ),
            Text(
              price,
              style: const TextStyle(
                  shadows: [
                    BoxShadow(
                        blurRadius: 8,
                        color: Colors.black26,
                        offset: Offset(0, 0))
                  ],
                  // color: Colors.green,
                  fontFamily: "Cairo",
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            const Text("   ل.س",
                style: TextStyle(
                    color: Constants.KprimaryColor,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                    fontSize: 10)),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "   خصائص العقار  ",
          style: TextStyle(
              shadows: [
                BoxShadow(
                    blurRadius: 8, color: Colors.black12, offset: Offset(0, 0))
              ],
              color: Constants.KprimaryColor,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
              fontSize: 22),
        ),
        const SizedBox(
          height: 33,
        )
      ],
    );
  }
}
