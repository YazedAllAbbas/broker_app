import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/pages/add_real_eastate_peages/rent_pages/real_estate_rant_values_configuration_page.dart';
import 'package:broker/pages/add_real_eastate_peages/sale_pages/real_estate_sale_values_configuration_page.dart';
import 'package:flutter/material.dart';

class ChooseTypeRealEastatePage extends StatelessWidget {
  const ChooseTypeRealEastatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "نوع العقار المضاف",
              style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Constants.KtitleColor),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton2(
                text: "للبيع",
                fun: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const RealEstateSaleValuesConfigurationPage(),
                  ));
                }),
            const SizedBox(
              height: 35,
              child: Divider(
                color: Constants.KprimaryColor,
                endIndent: 15,
                indent: 15,
              ),
            ),
            CustomButton2(
                text: "للإجار",
                fun: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const RealEstateRantValuesConfigurationPage(),
                  ));
                }),
            const SizedBox(
              height: 35,
              child: Divider(
                color: Constants.KprimaryColor,
                endIndent: 15,
                indent: 15,
              ),
            ),
            CustomButton2(text: "سكن مشترك", fun: () {}),
          ],
        ),
      ),
    );
  }
}
