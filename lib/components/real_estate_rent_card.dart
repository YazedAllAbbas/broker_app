import 'dart:convert';

import 'package:broker/constants.dart';
import 'package:broker/models/real_estate_model.dart';
import 'package:broker/pages/real_eastate_rant_info_page.dart';

import 'package:flutter/material.dart';

class RealEstateRentCard extends StatelessWidget {
  const RealEstateRentCard({
    super.key,
    required this.realEstateRent,
  });
  final RealEstateRentModel realEstateRent;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      width: double.infinity,
      height: 220,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RealEastateInfoRentPage(
            realEstateRent: realEstateRent,
          ),
        )),
        child: Stack(
          children: [
            Positioned(
                height: 220,
                left: 160,
                right: 20,
                child: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          blurRadius: 13,
                          color: Colors.black45,
                          offset: Offset(0, 0))
                    ], borderRadius: BorderRadius.circular(22)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image.memory(
                      base64Decode(realEstateRent.images[0]),
                      fit: BoxFit.cover,
                    ))),
            Positioned(
              top: 30,
              bottom: 30,
              right: 156,
              left: 30,
              child: Container(
                padding: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 7,
                          color: Colors.black45,
                          offset: Offset(0, 0))
                    ],
                    color: const Color(0xffEFF3F2).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(22)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        Text(
                          realEstateRent.realEastateType,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Constants.KprimaryColor,
                              fontFamily: "Cairo"),
                        ),
                        const SizedBox(
                          width: 13,
                        ),
                        Text(
                          realEstateRent.area,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Constants.KtitleColor,
                              fontFamily: "Cairo"),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          "م^2",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Constants.KtitleColor,
                              fontFamily: "Cairo"),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.favorite_border,
                          color: Constants.KprimaryColor,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 23,
                          color: Constants.KprimaryColor,
                        ),
                        Text(
                          realEstateRent.city,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Constants.KtitleColor,
                              fontFamily: "Cairo"),
                        ),
                        const Text(
                          " / ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Constants.KtitleColor,
                              fontFamily: "Cairo"),
                        ),
                        Text(
                          realEstateRent.region,
                          style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Constants.KtitleColor,
                              fontFamily: "Cairo"),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          Constants.formatPrice(
                              realEstateRent.priceForOneMonth),
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Constants.KtitleColor,
                              fontFamily: "Cairo"),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "ل.س  ",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              color: Constants.KtitleColor,
                              fontFamily: "Cairo"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 37,
                bottom: 13,
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 14, right: 14, bottom: 3),
                  decoration: BoxDecoration(
                    color: const Color(0xffEFF3F2).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: const Text(
                    "للإجار",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Constants.KprimaryColor,
                        fontFamily: "Cairo"),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
