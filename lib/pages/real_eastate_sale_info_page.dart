import 'package:broker/components/all_feature_for_sale.dart';
import 'package:broker/components/real_estate_Images_box.dart';
import 'package:broker/components/real_estate_additional_features_data.dart';
import 'package:broker/components/real_estate_main_data_box.dart';
import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/models/real_estate_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RealEastateSaleInfoPage extends StatefulWidget {
  final RealEstateSaleModel realEstateSale;
  const RealEastateSaleInfoPage({super.key, required this.realEstateSale});

  @override
  State<RealEastateSaleInfoPage> createState() =>
      _RealEastateSaleInfoPageState();
}

class _RealEastateSaleInfoPageState extends State<RealEastateSaleInfoPage> {
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "وصف العقار",
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
          SliverToBoxAdapter(
            child: RealEstateImageBox(
              imagePaths: widget.realEstateSale.images,
            ),
          ),
          SliverToBoxAdapter(
              child: RealEstateMainDataBox(
            type: widget.realEstateSale.realEastateType,
            area: widget.realEstateSale.area,
            city: widget.realEstateSale.city,
            price: Constants.formatPrice(widget.realEstateSale.price),
            region: widget.realEstateSale.region,
            descriptionAdrees: widget.realEstateSale.descriptionAdrees,
            category: 'للبيع',
          )),
          SliverToBoxAdapter(
            child: AllFeatureForSale(
              bathroomsNumber: widget.realEstateSale.bathroomsNumber,
              brushes: widget.realEstateSale.brushes,
              direction: widget.realEstateSale.direction,
              floorNumber: widget.realEstateSale.floorNumber,
              sellerType: widget.realEstateSale.sellerType,
              preparation: widget.realEstateSale.preparation,
              propertyType: widget.realEstateSale.propertyType,
            ),
          ),
          SliverToBoxAdapter(
            child: RealEstateAdditionalFeaturesData(
              wifi: widget.realEstateSale.wifi,
              carBark: widget.realEstateSale.carBark,
              swimmingPool: widget.realEstateSale.swimmingPool,
              elevator: widget.realEstateSale.elevator,
              solarEnergy: widget.realEstateSale.solarEnergy,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: CustomButton3(
                text: "تواصل مع مالك العقار",
                fun: () {
                  _makePhoneCall(widget.realEstateSale.phouneNumber);
                },
                primaryColor: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
