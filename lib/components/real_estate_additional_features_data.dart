import 'package:broker/constants.dart';
import 'package:flutter/material.dart';

class RealEstateAdditionalFeaturesData extends StatelessWidget {
  final bool wifi; // Wifi هل يحتوي على
  final bool elevator; // هل يحتوي على مصعد
  final bool carBark; // هل يحتوي على موقف سيارة
  final bool swimmingPool; // هل يحتوي على مسبح
  final bool solarEnergy; //هل يحتوي على طاقة شمسية

  const RealEstateAdditionalFeaturesData({
    super.key,
    required this.wifi,
    required this.elevator,
    required this.carBark,
    required this.swimmingPool,
    required this.solarEnergy,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (wifi || elevator || carBark || swimmingPool || solarEnergy)
            ? const Text(
                "   ميزات إضافية   ",
                style: TextStyle(
                    shadows: [
                      BoxShadow(
                          blurRadius: 8,
                          color: Color.fromARGB(31, 55, 31, 31),
                          offset: Offset(0, 0))
                    ],
                    color: Constants.KprimaryColor,
                    fontFamily: "Cairo",
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              )
            : const SizedBox(),
        const SizedBox(
          height: 20,
        ),
        wifi
            ? const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.wifi,
                      size: 24,
                      color: Constants.KprimaryColor,
                    ),
                    Text(
                      "  Wifi",
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        swimmingPool
            ? const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.pool_sharp,
                      size: 24,
                      color: Constants.KprimaryColor,
                    ),
                    Text(
                      "  مسبح",
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        carBark
            ? const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.car_repair,
                      size: 24,
                      color: Constants.KprimaryColor,
                    ),
                    Text(
                      "  موقف سيارة",
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        solarEnergy
            ? const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.solar_power_outlined,
                      size: 24,
                      color: Constants.KprimaryColor,
                    ),
                    Text(
                      "  طاقة شمسية",
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        elevator
            ? const Padding(
                padding: EdgeInsets.only(right: 20, bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.elevator_outlined,
                      size: 24,
                      color: Constants.KprimaryColor,
                    ),
                    Text(
                      "  مصعد",
                      style: TextStyle(
                          shadows: [
                            BoxShadow(
                                blurRadius: 8,
                                color: Colors.black26,
                                offset: Offset(0, 0))
                          ],
                          color: Constants.KtitleColor,
                          fontFamily: "Cairo",
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
