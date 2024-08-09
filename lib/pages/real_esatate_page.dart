import 'package:broker/components/real_estate_rent_card.dart';
import 'package:broker/custom_widgets/search_button.dart';
import 'package:broker/models/real_estate_model.dart';
import 'package:broker/service/real_eastate_service.dart';
import 'package:flutter/material.dart';
import '../components/drop_down.dart';

class RealEsatatePage extends StatefulWidget {
  final Function updateRealEstateList;
  const RealEsatatePage({super.key, required this.updateRealEstateList});

  @override
  State<RealEsatatePage> createState() => _RealEsatatePageState();
}

class _RealEsatatePageState extends State<RealEsatatePage> {
  List<RealEstateSaleModel> allRealEstateSale = [];
  List<RealEstateRentModel> allRealEstateRent = [];
  @override
  void initState() {
    allRealEstateSale = RealEastateSaleService.getAllRealEstateSale();
    allRealEstateRent = RealEastateRentService.getAllRealEstateRent();
    super.initState();
  }

  String selectedDisplay = "كل الفئات";
  final List<String> displayList = [
    "كل الفئات",
    "شقة",
    "فيلا",
    "مكتب",
    "محل تجاري",
    "شاليه"
  ];
  String selectedCity = "جميع المدن";
  final List<String> citesList = [
    "جميع المدن",
    "دمشق",
    "حمص",
    "اللاذقية",
    "طرطوس",
    "حلب",
    "الرقة",
    "أدلب",
    "دير الزور",
    "الحسكة",
    "القامشلي",
  ];
  String selectedSort = "الأحدث";
  final List<String> sortList = [
    "الأحدث",
    "الأقدم",
    "الأعلى سعراً",
    "الأدنى سعراً",
  ];
  String selectedType = "للبيع";
  final List<String> typeList = ["للبيع", "سكن مشترك", "للإجار"];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 20),
            child: Row(
              children: [
                const Expanded(flex: 7, child: SearchButton()),
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                    flex: 4,
                    child: DropDown(
                        onChanged: (value) {
                          setState(() {
                            selectedSort = value!;
                            sortRealEstateByPriceOrder(
                                allRealEstateRent, selectedSort);
                          });
                        },
                        selectedView: selectedSort,
                        mylist: sortList,
                        icon: const Icon(Icons.sort))),
                const Expanded(flex: 1, child: SizedBox())
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                const Spacer(),
                // DropDown(
                //     icon: const Icon(Icons.keyboard_double_arrow_down),
                //     selectedView: selectedType,
                //     mylist: typeList),
                // const Spacer(),
                // DropDown(
                //     icon: const Icon(Icons.maps_home_work_outlined),
                //     selectedView: selectedDisplay,
                //     mylist: displayList
                //     ),
                // const Spacer(),
                // DropDown(
                //     icon: const Icon(Icons.location_on_rounded),
                //     selectedView: selectedCity,
                //     mylist: citesList),
                const Spacer(),
              ],
            ),
          ),
          const Divider(endIndent: 40, indent: 40),
          Expanded(
            child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                    itemCount: allRealEstateRent.length,
                    itemBuilder: (context, index) => RealEstateRentCard(
                        realEstateRent: allRealEstateRent[index]))),
          ),
        ],
      ),
    );
  }
}
