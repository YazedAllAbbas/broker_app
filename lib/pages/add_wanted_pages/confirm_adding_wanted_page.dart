import 'package:broker/components/snack_bar.dart';
import 'package:broker/custom_widgets/custom_button.dart';
import 'package:broker/home.dart';
import 'package:broker/service/wanted_server.dart';
import 'package:flutter/material.dart';
import 'package:broker/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class ConfirmAddingWantedPage extends StatefulWidget {
  final Map<String, dynamic> formData;
  // final Function updateWantedList;

  const ConfirmAddingWantedPage({
    super.key,
    required this.formData,
    // required this.updateWantedList
  });

  @override
  State<ConfirmAddingWantedPage> createState() =>
      _ConfirmAddingWantedPageState();
}

class _ConfirmAddingWantedPageState extends State<ConfirmAddingWantedPage> {
  bool isLodaing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "تأكيد الطلب",
          style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Constants.KprimaryColor,
          ),
        ),
        actions: [
          Image.asset(
            height: 55,
            width: 70,
            Constants.logo,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ModalProgressHUD(
          inAsyncCall: isLodaing,
          child: Column(
            children: [
              const SizedBox(height: 50),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "* ",
                    style:
                        TextStyle(fontSize: 17, color: Constants.KtitleColor),
                  ),
                  Text(
                    "طلبك سيكون بشكل التالي",
                    style: TextStyle(
                      color: Constants.KprimaryColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: "Cairo",
                    ),
                  ),
                  Text(
                    " *",
                    style:
                        TextStyle(fontSize: 17, color: Constants.KtitleColor),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 7,
                      color: Colors.black26,
                      offset: Offset(0, 0),
                    )
                  ],
                  color: const Color(0xffEFF3F2).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(22),
                ),
                padding: const EdgeInsets.only(
                    left: 10, right: 10, bottom: 10, top: 8),
                margin:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "مطلوب عقار ",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.formData["type"] == "rent"
                              ? "للإجار"
                              : "للبيع",
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          " في ",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.formData["city"],
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.place_outlined,
                          size: 17,
                          color: Constants.KtitleColor,
                        ),
                        const Text(
                          "منطقة  ",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 14,
                            color: Constants.KtitleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          widget.formData["region"],
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 14,
                            color: Constants.KprimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        const Icon(
                          Icons.price_change_rounded,
                          size: 16,
                          color: Constants.KtitleColor,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          "الميزانية",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 13,
                            color: Constants.KtitleColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          Constants.formatPrice(widget.formData["budget"]),
                          style: const TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 14,
                            color: Constants.KprimaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 3),
                        const Text(
                          "ل.س",
                          style: TextStyle(
                            fontFamily: "Cairo",
                            fontSize: 11,
                            color: Constants.KtitleColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Text(
                      widget.formData["descriptionOfWanted"],
                      style: const TextStyle(
                        fontFamily: "Cairo",
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "* ",
                    style:
                        TextStyle(color: Constants.KprimaryColor, fontSize: 17),
                  ),
                  Text(
                    " قم بتأكيد إضافة الطلب",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: "Cairo",
                    ),
                  ),
                  Text(
                    " *",
                    style:
                        TextStyle(color: Constants.KprimaryColor, fontSize: 17),
                  ),
                ],
              ),
              const Text(
                "في حال قمت بتأكيد إضافة الطلب، سيتمكن الأشخاص الآخرون الذين يمتلكون عقار يطابق طلبك من التواصل معك باستخدام الرقم الذي قمت بإرفاقه مع الطلب.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constants.KtitleColor,
                  fontSize: 15,
                  fontFamily: "Cairo",
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "رقم هاتفك :  ",
                    style: TextStyle(
                      color: Constants.KprimaryColor,
                      fontSize: 15,
                      fontFamily: "Cairo",
                    ),
                  ),
                  Text(
                    widget.formData["phoneNumber"],
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Cairo",
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 40, right: 5, left: 5),
                width: double.infinity,
                child: Row(
                  children: [
                    const Spacer(),
                    Expanded(
                      flex: 5,
                      child: CustomButton3(
                        text: "تأكيد",
                        fun: () async {
                          isLodaing = true;
                          setState(() {});
                          try {
                            WantedService wantedService = WantedService();
                            String result = await wantedService.addWanted(
                              budget: widget.formData["budget"],
                              city: widget.formData["city"],
                              region: widget.formData["region"],
                              description:
                                  widget.formData["descriptionOfWanted"],
                              phone: widget.formData["phoneNumber"],
                              type: widget.formData["type"],
                            );
                            if (result == 'success') {
                              if (context.mounted) {
                                CustomSnackBar.showSnackBar(
                                    context, "تم إضافة طلبك", true);
                              }
                            } else {
                              if (context.mounted) {
                                CustomSnackBar.showSnackBar(
                                    context, result.toString(), false);
                              }
                            }
                          } catch (e) {
                            print("add wanted error: ${e.toString()}");
                            if (context.mounted) {
                              CustomSnackBar.showSnackBar(
                                  context, e.toString(), false);
                            }
                          }
                          isLodaing = false;
                          setState(() {});
                          // إغلاق الصفحة بعد الانتهاء
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
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
            ],
          ),
        ),
      ),
    );
  }
}
