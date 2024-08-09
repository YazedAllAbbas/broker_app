import 'package:broker/constants.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/pages/add_real_eastate_peages/sale_pages/confirm_adding_real_estate_sale_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'dart:io';

class RealEstateRentImagesConfigurationPage extends StatefulWidget {
  final Map<String, dynamic> formData;

  const RealEstateRentImagesConfigurationPage(
      {super.key, required this.formData});

  @override
  // ignore: library_private_types_in_public_api
  _RealEstateRentImagesConfigurationPageState createState() =>
      _RealEstateRentImagesConfigurationPageState();
}

class _RealEstateRentImagesConfigurationPageState
    extends State<RealEstateRentImagesConfigurationPage> {
  List<String> images = [];
  List<File?> imageFiles = List.generate(12, (index) => null);

  // تابع من أجل جلب الصورة من الأستديو وتخزينها في ملف الصورة
  Future<void> _pickImage(int index) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        File imageFile = File(pickedFile.path);
        String base64Image = base64Encode(imageFile.readAsBytesSync());

        if (images.length > index) {
          images[index] = base64Image;
        } else {
          images.add(base64Image);
        }
        imageFiles[index] = imageFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "إضافة صور العقار",
          style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Constants.KprimaryColor),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "* ",
                style: TextStyle(color: Constants.KprimaryColor, fontSize: 17),
              ),
              Text(
                "يجب على الأقل إضافة أربع صور",
                style: TextStyle(
                    color: Constants.KtitleColor,
                    fontSize: 20,
                    fontFamily: "Cairo"),
              ),
              Text(
                " *",
                style: TextStyle(color: Constants.KprimaryColor, fontSize: 17),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 7,
                        color: Colors.black26,
                        offset: Offset(0, 0))
                  ],
                  color: const Color(0xffEFF3F2).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(22)),
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 15),
              padding: const EdgeInsets.all(13),
              child: GridView.builder(
                  // physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15),
                  itemCount: 12,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () => _pickImage(index),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: Colors.black26,
                                  offset: Offset(0, 0))
                            ],
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.grey[300],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: imageFiles[index] != null
                                ? Image.file(
                                    imageFiles[index]!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  )
                                : const Icon(
                                    Icons.add_photo_alternate_outlined,
                                    size: 35,
                                    color: Constants.KprimaryColor,
                                  ),
                          ),
                        ),
                      )),
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                  flex: 5,
                  child: CustomButton3(
                    text: "التالي",
                    fun: () {
                      widget.formData["images"] = images;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ConfirmAddingRealEstateSalePage(
                              formData: widget.formData)));
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
            height: 50,
          ),
        ],
      ),
    );
  }
}
