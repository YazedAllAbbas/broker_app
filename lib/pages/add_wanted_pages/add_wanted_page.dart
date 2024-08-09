import 'package:broker/components/drop_down_tile.dart';
import 'package:broker/components/snack_bar.dart';
import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/custom_widgets/custom_text_filed_with_title.dart';
import 'package:broker/pages/add_wanted_pages/confirm_adding_wanted_page.dart';
import 'package:flutter/material.dart';

class AddWantedPage extends StatefulWidget {
  const AddWantedPage({super.key});
  @override
  State<AddWantedPage> createState() => _AddWantedPageState();
}

class _AddWantedPageState extends State<AddWantedPage> {
// دالة مساعدة لتنسيق الرقم بدون أصفار زائدة
  String? city;
  TextEditingController region = TextEditingController();
  TextEditingController budget = TextEditingController();
  TextEditingController descriptionOfWanted = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  List<bool> isSelected = [true, false]; // القيمة الافتراضية
  final GlobalKey<FormState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: ListView(
            children: [
              Center(
                child: ToggleButtons(
                  borderRadius: BorderRadius.circular(22),
                  borderColor: Constants.KprimaryColor,
                  // disabledBorderColor: Constants.KprimaryColor,
                  selectedBorderColor: Constants.KprimaryColor,
                  selectedColor: Colors.white,
                  borderWidth: 2,
                  color: Constants.KprimaryColor,
                  disabledColor: Constants.KprimaryColor,
                  fillColor: Constants.KprimaryColor,
                  isSelected: isSelected,
                  onPressed: (int index) {
                    setState(() {
                      for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                    });
                  },
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "للشراء",
                        style: TextStyle(fontSize: 26, fontFamily: "Cairo"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "للآجار ",
                        style: TextStyle(fontSize: 26, fontFamily: "Cairo"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              DropDownTile(
                title: "المدينة",
                selectedValue: city,
                dropdownValueList: Constants.citesList,
                dropDownfun: (newValue) {
                  setState(() {
                    city = newValue!;
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
                controller: budget,
                title: "الميزانية",
              ),
              CustomTextFiledWithTitle(
                textInputType: TextInputType.phone,
                controller: phoneNumber,
                title: "رقم هاتفك",
              ),
              Container(
                margin: const EdgeInsets.only(
                    left: 5, right: 5, top: 20, bottom: 30),
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 7,
                          color: Colors.black26,
                          offset: Offset(0, 0))
                    ],
                    color: const Color(0xffEFF3F2).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(22)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.edit,
                            size: 23,
                            color: Constants.KtitleColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "قم بكتابة وصف للطلب",
                            style: TextStyle(
                              fontFamily: "Cairo",
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Constants.KprimaryColor,
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "";
                          }
                          return null;
                        },
                        controller: descriptionOfWanted,
                        maxLines: 4,
                        minLines: 3,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 60),
                  child: CustomButton(
                      text: "إضافة",
                      width: 200,
                      fun: () {
                        if (key.currentState!.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ConfirmAddingWantedPage(
                              formData: {
                                "city": city,
                                "region": region.text,
                                "budget": budget.text,
                                "descriptionOfWanted": descriptionOfWanted.text,
                                "phoneNumber": phoneNumber.text,
                                "type": isSelected[0] ? "sale" : "rent",
                              },
                            ),
                          ));
                        } else {
                          CustomSnackBar.showSnackBar(
                              context, "يجب ان تقوم بملئ جميع الحقول", false);
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
