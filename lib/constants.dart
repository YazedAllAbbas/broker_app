// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static const Color KprimaryColor = Color(0xffF98951);
  static const Color KtitleColor = Color(0xff818181);
  // ignore: non_constant_identifier_names
  static Color KbackGroundCard = const Color(0xffEFF3F2).withOpacity(0.9);

  static const String logo = "assets/images/BrokerOnlineAppLogo.png";
  static String _formatNumber(double number) {
    return number.toString().replaceAll(RegExp(r'([.]*0)(?!.*\d)'), '');
  }

  static String formatPrice(String price) {
    // تحويل السلسلة النصية إلى رقم
    double number = double.tryParse(price.replaceAll(',', '')) ?? 0;

    // تحديد الفئة السعرية المناسبة
    if (number >= 1000000000) {
      return _formatNumber(number / 1000000000) + ' مليار';
    } else if (number >= 1000000) {
      return _formatNumber(number / 1000000) + ' مليون';
    } else if (number >= 1000) {
      return _formatNumber(number / 1000) + ' ألف';
    } else {
      return number.toString();
    }
  }

  static const List<String> typeRealEastateList = [
    "شقة",
    "فيلا",
    "مكتب",
    "محل تجاري",
    "شاليه"
  ];
  static const List<String> directionList = [
    "الغرب",
    "الشرق",
    "الشمال",
    "الجنوب",
    "الشمال الشرقي",
    "الجنوب الشرقي",
    "الشمال الغربي",
    "الجنوب الغربي",
    "الشمال الجنوبي",
    "الغرب الشرقي",
  ];
  static const List<String> propertyTypeList = [
    "طابو أخضر",
    "حكم محكمة",
    "عقد بيع قطعي",
    "وكالة كاتب عدل",
    "طابو أسهم",
    "طابو زراعي",
    "طابو إسكان ",
    "فروغ",
  ];
  static const List<String> brushesList = [
    "مفروش",
    "غير مفروش",
    "نصف مفروش",
  ];
  static const List<String> preparationList = [
    "سوبر ديلوكس",
    "كسوة جديدة",
    "كسوة جيدة",
    "كسوة قديمة",
    "على العظم",
  ];
  static const List<String> sellerTypeList = [
    "مالك العقار",
    "تاجر",
  ];
  static const List<String> leaseList = [
    "شهري",
    "سنوي",
  ];
  static const List<String> floorNumberList = [
    "طابق أرضي",
    "طابق 1",
    "طابق 2",
    "طابق 3",
    "طابق 4",
    "طابق 5",
    "طابق 6",
    "طابق 7",
    "طابق 8",
    "طابق 9",
    "طابق 10",
    "طابق 11",
    "طابق 12",
    "طابق 13",
    "طابق 14",
    "طابق 15",
    "قبو",
  ];
  static const List<String> citesList = [
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
  static const Map<String, TextInputType> listOfInputType = {
    "_email": TextInputType.emailAddress,
    "_numberPhone": TextInputType.phone,
    "_name": TextInputType.text,
    "_password": TextInputType.visiblePassword,
  };

  static const List<String> additionalFeaturesList = [
    "WiFi",
    "مسبح",
    "طاقة شمسية",
    "كراج",
    "مصعد",
  ];
  static const List<String> damascusAreas = [
    "المزة",
    "كفرسوسة",
    "الميدان",
    "المالكي",
    "الروضة",
    "مشروع دمر",
    "جرمانا",
    "باب توما",
    "باب مصلى",
    "الشعلان",
    "الحميدية",
    "الشهابية",
    "ميدان الحسن",
    "العباسيين",
    "المرجة",
    "سرايا الأشرفية",
    "العدوية",
    "الصالحية الجديدة",
    "مشروع 10450",
    "مشروع 10700",
    "الركن الديني",
    "الصحافة",
    "الفحامة",
    "الدوار السابع",
    "الشيخ محمود",
    "السلمانية",
    "المهاجرين",
    "الميدان الجديد",
    "المزرعة",
    "المزة الجديدة",
    "المزة القديمة",
    "الزهراء",
    "الصفافير",
    "الجباية",
    "المطران",
    "العدرا",
    "الصحنة",
    "القصور",
    "الدويلعة",
    "الصفا",
    "الحمراء",
    "العباسيين",
    "بيت جن",
    "قابون",
    "ركن الدين",
    "السويقة",
    "السرايا",
    "الشاغور",
    "التل",
    "التجمع الخامس",
    "التجمع الخامس التجاري",
    "التجمع الأول",
    "الميدان",
    "السبيل",
    "دمر",
    "السلم",
    "الشهداء",
    "الكرامة",
    "الشاغور",
    "سريجة",
    "ميدان",
    "العباسيين",
    "بستان الدين",
    "النبك",
    "السويداء",
    "السرايا",
    "قدسيا",
    "دوما",
    "دمشق الجديدة",
    "المزرعة الجديدة",
    "العدوية",
    "حي الأمويين",
    "قرية البستان",
    "الصحافة",
    "الصفافير",
    "ركن الدين",
    "السويقة",
    "المهاجرين",
    "المزة الجديدة",
    "المزة القديمة",
    "السلمانية",
    "المرجة",
    "سرايا الأشرفية",
    "ميدان الحسن",
    "الشهابية",
    "الشعلان",
  ];
}
