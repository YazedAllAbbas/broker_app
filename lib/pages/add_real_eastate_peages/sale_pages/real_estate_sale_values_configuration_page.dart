import 'package:broker/components/box_description_address.dart';
import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/pages/add_real_eastate_peages/real_estate_rent_images_configuration_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../components/drop_down_tile.dart';
import '../../../custom_widgets/custom_text_filed_with_title.dart';

class RealEstateSaleValuesConfigurationPage extends StatefulWidget {
  const RealEstateSaleValuesConfigurationPage({super.key});

  @override
  State<RealEstateSaleValuesConfigurationPage> createState() =>
      _RealEstateSaleValuesConfigurationPageState();
}

class _RealEstateSaleValuesConfigurationPageState
    extends State<RealEstateSaleValuesConfigurationPage> {
  String? floorNumber; //رقم الطابق
  String? realEastateType; //(شقة أو فيلا...إلخ) نوع العقار
  String? direction; //الإتجاه
  String? city; //المدينة
  String? brushes; //نوع الفرش
  String? preparation; //تجهيز المنزل
  String? sellerType; //نوع البائع
  String? propertyType; //  .... نوع الملكية : طابو أخضر أو حكم محكمة
  bool? wifi = false; // Wifi هل يحتوي على
  bool? elevator = false; // هل يحتوي على مصعد
  bool? carBark = false; //هل يحتوي على موقف سيارة
  bool? swimmingPool = false; // هل يحتوي على مسبح
  bool? solarEnergy = false; //هل يحتوي على طاقة شمسية
  TextEditingController price = TextEditingController(); //السعر
  TextEditingController bathroomsNumber = TextEditingController(); //عدد الحممات
  TextEditingController area = TextEditingController(); //المساحة
  TextEditingController descriptionAdrees =
      TextEditingController(); //وصف الموقع
  TextEditingController phoneNumber =
      TextEditingController(); //رقم هاتف صاحب العقار
  TextEditingController region = TextEditingController(); //المنطقة
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "إضافة عقار",
          style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 32,
              fontWeight: FontWeight.bold,
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
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: ListView(
            children: [
              const SizedBox(
                height: 22,
              ),
              DropDownTile(
                title: "نوع العقار",
                selectedValue: realEastateType,
                dropdownValueList: Constants.typeRealEastateList,
                dropDownfun: (newValue) {
                  setState(() {
                    realEastateType = newValue;
                  });
                },
              ),
              DropDownTile(
                title: "المدينة",
                selectedValue: city,
                dropdownValueList: Constants.citesList,
                dropDownfun: (newValue) {
                  setState(() {
                    city = newValue;
                  });
                },
              ),
              CustomTextFiledWithTitle(
                textInputType: TextInputType.name,
                controller: region,
                title: "المنطقة",
              ),
              CustomTextFiledWithTitle(
                textInputType: TextInputType.number,
                controller: area,
                title: "المساحة",
              ),
              DropDownTile(
                title: "نوع الملكية",
                selectedValue: propertyType,
                dropdownValueList: Constants.propertyTypeList,
                dropDownfun: (newValue) {
                  setState(() {
                    propertyType = newValue;
                  });
                },
              ),
              DropDownTile(
                title: "نوع البائع",
                selectedValue: sellerType,
                dropdownValueList: Constants.sellerTypeList,
                dropDownfun: (newValue) {
                  setState(() {
                    sellerType = newValue;
                  });
                },
              ),
              DropDownTile(
                title: "الفرش",
                selectedValue: brushes,
                dropdownValueList: Constants.brushesList,
                dropDownfun: (newValue) {
                  setState(() {
                    brushes = newValue;
                  });
                },
              ),
              DropDownTile(
                title: "الأتجاه",
                selectedValue: direction,
                dropdownValueList: Constants.directionList,
                dropDownfun: (newValue) {
                  setState(() {
                    direction = newValue;
                  });
                },
              ),
              DropDownTile(
                title: "التجهيز",
                selectedValue: preparation,
                dropdownValueList: Constants.preparationList,
                dropDownfun: (newValue) {
                  setState(() {
                    preparation = newValue;
                  });
                },
              ),
              DropDownTile(
                title: "رقم الطابق",
                selectedValue: floorNumber,
                dropdownValueList: Constants.floorNumberList,
                dropDownfun: (newValue) {
                  setState(() {
                    floorNumber = newValue;
                  });
                },
              ),
              CustomTextFiledWithTitle(
                textInputType: TextInputType.number,
                controller: bathroomsNumber,
                title: "عدد الحمامات",
              ),
              CustomTextFiledWithTitle(
                textInputType: TextInputType.number,
                controller: price,
                title: "السعر",
              ),
              CustomTextFiledWithTitle(
                textInputType: TextInputType.phone,
                controller: phoneNumber,
                title: "رقم هاتفك",
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 5, right: 5, top: 10, bottom: 35),
                height: 210,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 7,
                          color: Colors.black26,
                          offset: Offset(0, 0))
                    ],
                    color: const Color(0xffEFF3F2).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(22)),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.add,
                            color: Constants.KtitleColor,
                            size: 25,
                          ),
                          Text(
                            "ميزات إضافية",
                            style: TextStyle(
                                fontFamily: "Cairo",
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Constants.KprimaryColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: GridView.count(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 15,
                          childAspectRatio: 5,
                          children: [
                            _buildFeatureCheckbox("WiFi", wifi!, (value) {
                              setState(() {
                                wifi = value;
                              });
                            }),
                            _buildFeatureCheckbox("مسبح", swimmingPool!,
                                (value) {
                              setState(() {
                                swimmingPool = value;
                              });
                            }),
                            _buildFeatureCheckbox("طاقة شمسية", solarEnergy!,
                                (value) {
                              setState(() {
                                solarEnergy = value;
                              });
                            }),
                            _buildFeatureCheckbox("كراج", carBark!, (value) {
                              setState(() {
                                carBark = value;
                              });
                            }),
                            _buildFeatureCheckbox("مصعد", elevator!, (value) {
                              setState(() {
                                elevator = value;
                              });
                            }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BoxDescriptionAdress(descriptionAdrees: descriptionAdrees),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                      flex: 5,
                      child: CustomButton3(
                        text: "التالي",
                        fun: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                RealEstateRentImagesConfigurationPage(
                              forSale: true,
                              formData: {
                                "region": region.text,
                                'floorNumber': floorNumber,
                                'realEastateType': realEastateType,
                                'direction': direction,
                                'city': city,
                                'brushes': brushes,
                                'preparation': preparation,
                                'sellerType': sellerType,
                                'propertyType': propertyType,
                                'wifi': wifi,
                                'elevator': elevator,
                                'carBark': carBark,
                                'swimmingPool': swimmingPool,
                                'solarEnergy': solarEnergy,
                                'price': price.text,
                                'bathroomsNumber': bathroomsNumber.text,
                                'area': area.text,
                                'descriptionAdrees': descriptionAdrees.text,
                                'phoneNumber': phoneNumber.text,
                              },
                            ),
                          ));
                        },
                        primaryColor: true,
                      )),
                  const Spacer(),
                  Expanded(
                      flex: 5,
                      child: CustomButton3(
                        text: "رجوع",
                        fun: () {
                          Navigator.of(context).pop();
                        },
                        primaryColor: false,
                      )),
                  const Spacer(),
                ],
              ),
              const SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureCheckbox(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return Container(
      alignment: Alignment.center,
      child: CheckboxListTile(
        onChanged: onChanged,
        value: value,
        activeColor: Constants.KprimaryColor,
        side: const BorderSide(width: 1.7, color: Constants.KprimaryColor),
        contentPadding: const EdgeInsets.all(0),
        title: Text(
          title,
          style: const TextStyle(
              shadows: [
                Shadow(
                    color: Colors.black12, blurRadius: 8, offset: Offset(3, 3)),
              ],
              fontFamily: "Cairo",
              fontSize: 15,
              color: Constants.KtitleColor,
              fontWeight: FontWeight.bold),
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }
}
