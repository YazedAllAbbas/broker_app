import 'package:broker/components/all_feature_for_rent.dart';
import 'package:broker/components/real_estate_Images_box.dart';
import 'package:broker/components/real_estate_additional_features_data.dart';
import 'package:broker/components/real_estate_main_data_box.dart';
import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/models/real_estate_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RealEastateInfoRentPage extends StatefulWidget {
  final RealEstateRentModel realEstateRent;
  const RealEastateInfoRentPage({super.key, required this.realEstateRent});

  @override
  State<RealEastateInfoRentPage> createState() =>
      _RealEastateInfoRentPageState();
}

class _RealEastateInfoRentPageState extends State<RealEastateInfoRentPage> {
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
              imagePaths: widget.realEstateRent.images,
            ),
          ),
          SliverToBoxAdapter(
              child: RealEstateMainDataBox(
            type: widget.realEstateRent.realEastateType,
            area: widget.realEstateRent.area,
            city: widget.realEstateRent.city,
            price:
                Constants.formatPrice(widget.realEstateRent.priceForOneMonth),
            region: widget.realEstateRent.region,
            descriptionAdrees: widget.realEstateRent.descriptionAdrees,
            category: "للإجار",
          )),
          SliverToBoxAdapter(
            child: AllFeatureForRent(
              bathroomsNumber: widget.realEstateRent.bathroomsNumber,
              brushes: widget.realEstateRent.brushes,
              direction: widget.realEstateRent.direction,
              floorNumber: widget.realEstateRent.floorNumber,
              sellerType: widget.realEstateRent.sellerType,
              preparation: widget.realEstateRent.preparation,
              lease: widget.realEstateRent.lease,
            ),
          ),
          SliverToBoxAdapter(
            child: RealEstateAdditionalFeaturesData(
              wifi: widget.realEstateRent.wifi,
              carBark: widget.realEstateRent.carBark,
              swimmingPool: widget.realEstateRent.swimmingPool,
              elevator: widget.realEstateRent.elevator,
              solarEnergy: widget.realEstateRent.solarEnergy,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: CustomButton3(
                text: "تواصل مع مالك العقار",
                fun: () {
                  _makePhoneCall(widget.realEstateRent.phouneNumber);
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
