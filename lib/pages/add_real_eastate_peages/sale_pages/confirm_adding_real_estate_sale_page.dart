import 'package:broker/components/all_feature_for_sale.dart';
import 'package:broker/components/real_estate_Images_box.dart';
import 'package:broker/components/real_estate_additional_features_data.dart';
import 'package:broker/components/real_estate_main_data_box.dart';
import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/home.dart';
import 'package:broker/models/real_estate_model.dart';
import 'package:broker/service/real_eastate_service.dart';

import 'package:flutter/material.dart';

class ConfirmAddingRealEstateSalePage extends StatefulWidget {
  final Map<String, dynamic> formData;
  const ConfirmAddingRealEstateSalePage({super.key, required this.formData});

  @override
  State<ConfirmAddingRealEstateSalePage> createState() =>
      _ConfirmAddingRealEstateSalePageState();
}

class _ConfirmAddingRealEstateSalePageState
    extends State<ConfirmAddingRealEstateSalePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "تأكيد الإضافة",
          style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 30,
              fontWeight: FontWeight.w600,
              color: Constants.KprimaryColor),
        ),
        actions: [
          Image.asset(
            height: 55,
            width: 70,
            Constants.logo,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            width: 6,
          ),
        ],
        iconTheme: const IconThemeData(color: Colors.black54, size: 35),
        backgroundColor: Colors.white,
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            child: Text(
              "سيتم عرض عقارك بشكل التالي في التطبيق قم بمراجعة معلومات العقار ومن ثم تأكيد الإضافة ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Cairo",
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Constants.KtitleColor),
            ),
          )),
          SliverToBoxAdapter(
            child: RealEstateImageBox(
              imagePaths: widget.formData["images"],
            ),
          ),
          SliverToBoxAdapter(
              child: RealEstateMainDataBox(
            category: "للبيع",
            type: widget.formData["realEastateType"],
            area: widget.formData["area"],
            city: widget.formData["city"],
            price: Constants.formatPrice(widget.formData["price"]),
            region: widget.formData["region"],
            descriptionAdrees: widget.formData["descriptionAdrees"],
          )),
          SliverToBoxAdapter(
            child: AllFeatureForSale(
              bathroomsNumber: widget.formData["bathroomsNumber"],
              brushes: widget.formData["brushes"],
              direction: widget.formData["direction"],
              floorNumber: widget.formData["floorNumber"],
              sellerType: widget.formData["sellerType"],
              preparation: widget.formData["preparation"],
              propertyType: widget.formData["propertyType"],
            ),
          ),
          SliverToBoxAdapter(
            child: RealEstateAdditionalFeaturesData(
              wifi: widget.formData["wifi"],
              carBark: widget.formData["carBark"],
              swimmingPool: widget.formData["swimmingPool"],
              elevator: widget.formData["elevator"],
              solarEnergy: widget.formData["solarEnergy"],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 5),
              child: Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 5,
                    child: CustomButton3(
                      text: "تأكيد",
                      fun: () {
                        RealEastateSaleService.allRealEstateSale
                            .add(RealEstateSaleModel(
                          phouneNumber: widget.formData["phoneNumber"],
                          realEastateType: widget.formData["realEastateType"],
                          area: widget.formData["area"],
                          city: widget.formData["city"],
                          price: widget.formData["price"],
                          region: widget.formData["region"],
                          descriptionAdrees:
                              widget.formData["descriptionAdrees"],
                          bathroomsNumber: widget.formData["bathroomsNumber"],
                          brushes: widget.formData["brushes"],
                          direction: widget.formData["direction"],
                          floorNumber: widget.formData["floorNumber"],
                          sellerType: widget.formData["sellerType"],
                          preparation: widget.formData["preparation"],
                          propertyType: widget.formData["propertyType"],
                          wifi: widget.formData["wifi"],
                          carBark: widget.formData["carBark"],
                          swimmingPool: widget.formData["swimmingPool"],
                          elevator: widget.formData["elevator"],
                          solarEnergy: widget.formData["solarEnergy"],
                          images: widget.formData["images"],
                        ));
                        // إغلاق الصفحة بعد الانتهاء
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ));
                      },
                      primaryColor: true,
                    ),
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 5,
                    child: CustomButton3(
                      text: "تعديل",
                      fun: () {
                        Navigator.of(context).pop();
                      },
                      primaryColor: false,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
