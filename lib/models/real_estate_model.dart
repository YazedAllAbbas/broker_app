class RealEstateModel {
  final String realEastateType; //(شقة أو فيلا...إلخ) نوع العقار
  final String direction; //الإتجاه
  final String city; //المدينة
  final String region; //المنطقة
  final String floorNumber; //رقم الطابق
  final String brushes; //نوع الفرش
  final String preparation; //تجهيز المنزل
  final String sellerType; //نوع البائع
  final String bathroomsNumber; //عدد الحممات
  final String area; //المساحة
  final String descriptionAdrees; //وصف الموقع
  final bool wifi; // Wifi هل يحتوي على
  final bool elevator; // هل يحتوي على مصعد
  final bool carBark; // هل يحتوي على موقف سيارة
  final bool swimmingPool; // هل يحتوي على مسبح
  final bool solarEnergy; //هل يحتوي على طاقة شمسية
  double evaluation = 0; // تقييم العقار
  int views = 0; // عدد المشاهدات
  final List<String> images; // صور العقار
  final String phouneNumber;
  final DateTime dateAdded; // تاريخ الإضافة
  RealEstateModel(
      {required this.realEastateType,
      required this.phouneNumber,
      required this.images,
      required this.direction,
      required this.city,
      required this.region,
      required this.floorNumber,
      required this.brushes,
      required this.preparation,
      required this.sellerType,
      required this.wifi,
      required this.swimmingPool,
      required this.solarEnergy,
      required this.elevator,
      required this.carBark,
      required this.bathroomsNumber,
      required this.area,
      DateTime? dateAdded,
      required this.descriptionAdrees})
      : dateAdded = dateAdded ?? DateTime.now();
}

class RealEstateSaleModel extends RealEstateModel {
  final String price; // السعر
  final String propertyType; //  .... نوع الملكية : طابو أخضر أو حكم محكمة-

  RealEstateSaleModel(
      {required this.price,
      required this.propertyType,
      required super.realEastateType,
      required super.images,
      required super.direction,
      required super.city,
      required super.region,
      required super.floorNumber,
      required super.brushes,
      required super.preparation,
      required super.sellerType,
      required super.wifi,
      required super.swimmingPool,
      required super.solarEnergy,
      required super.elevator,
      required super.carBark,
      required super.bathroomsNumber,
      required super.area,
      required super.descriptionAdrees,
      required super.phouneNumber})
      : super(dateAdded: DateTime.now());
}

class RealEstateRentModel extends RealEstateModel {
  final String priceForOneMonth; // تكلفة إجار الشهر الواحد
  final String lease; // عقد الإجار (سنوي أو شهري)

  RealEstateRentModel({
    required super.realEastateType,
    required super.images,
    required super.direction,
    required super.city,
    required super.region,
    required super.floorNumber,
    required super.brushes,
    required super.preparation,
    required super.sellerType,
    required super.wifi,
    required super.elevator,
    required super.carBark,
    required super.bathroomsNumber,
    required super.area,
    required super.descriptionAdrees,
    required this.priceForOneMonth,
    required this.lease,
    required super.swimmingPool,
    required super.solarEnergy,
    required super.phouneNumber,
  }) : super(dateAdded: DateTime.now());
}

void sortRealEstateByPriceOrder(
    List<RealEstateModel> realEstates, String order) {
  realEstates.sort((a, b) {
    double priceA = 0.0;
    double priceB = 0.0;

    if (a is RealEstateSaleModel && b is RealEstateSaleModel) {
      priceA = double.tryParse(a.price.replaceAll(',', '')) ?? 0.0;
      priceB = double.tryParse(b.price.replaceAll(',', '')) ?? 0.0;
    } else if (a is RealEstateRentModel && b is RealEstateRentModel) {
      priceA = double.tryParse(a.priceForOneMonth.replaceAll(',', '')) ?? 0.0;
      priceB = double.tryParse(b.priceForOneMonth.replaceAll(',', '')) ?? 0.0;
    } else {
      return 0;
    }

    if (order == 'الأعلى سعراً') {
      return priceB.compareTo(priceA); // ترتيب تنازلي
    } else if (order == 'الأدنى سعراً') {
      return priceA.compareTo(priceB); // ترتيب تصاعدي
    } else if (order == 'الأحدث') {
      return b.dateAdded.compareTo(a.dateAdded); // ترتيب تنازلي حسب التاريخ
    } else if (order == 'الأقدم') {
      return a.dateAdded.compareTo(b.dateAdded); // ترتيب تصاعدي حسب التاريخ
    }
    return 0; // حالة افتراضية إذا لم يتم توفير ترتيب صحيح
  });
}
