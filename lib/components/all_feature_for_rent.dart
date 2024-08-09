import 'package:broker/components/real_estate_feature.dart';
import 'package:flutter/material.dart';

class AllFeatureForRent extends StatelessWidget {
  final String floorNumber; //رقم الطابق
  final String direction; //الإتجاه
  final String brushes; //نوع الفرش
  final String preparation; //تجهيز المنزل
  final String sellerType; //نوع البائع
  final String lease; // عقد الإجار (سنوي أو شهري)
  final String bathroomsNumber; //عدد الحممات

  const AllFeatureForRent(
      {super.key,
      required this.floorNumber,
      required this.direction,
      required this.brushes,
      required this.preparation,
      required this.sellerType,
      required this.bathroomsNumber,
      required this.lease});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> features = [
      {"رقم الطابق": floorNumber},
      {"الإتجاه": direction},
      {"تجهيز المنزل": preparation},
      {"الفرش": brushes},
      {"عقد الإجار": lease},
      {"نوع البائع": sellerType},
      {"عدد الحممات": bathroomsNumber},
    ];
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: features.length,
      itemBuilder: (context, index) {
        // Map استخراج أول مفتاح وقيمة من ال
        final feature = features[index].entries.first;
        return RealEstateFeature(title: feature.key, value: feature.value);
      },
    );
  }
}
