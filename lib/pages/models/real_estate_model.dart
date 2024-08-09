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
  final bool swimmingPool = false; // هل يحتوي على مسبح
  final bool solarEnergy = false; //هل يحتوي على طاقة شمسية
  double evaluation = 0; // تقييم العقار
  int views = 0; // عدد المشاهدات
  final List<String> images; // صور العقار

  RealEstateModel(
      {required this.realEastateType,
      required this.images,
      required this.direction,
      required this.city,
      required this.region,
      required this.floorNumber,
      required this.brushes,
      required this.preparation,
      required this.sellerType,
      required this.wifi,
      required this.elevator,
      required this.carBark,
      required this.bathroomsNumber,
      required this.area,
      required this.descriptionAdrees});
}

class RealEstateSaleModel extends RealEstateModel {
  final String price; // السعر
  final String propertyType; //  .... نوع الملكية : طابو أخضر أو حكم محكمة-

  RealEstateSaleModel(
      {required super.realEastateType,
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
      required this.price,
      required this.propertyType}); //  .... نوع الملكية : طابو أخضر أو حكم محكمة
}

class RealEstateRentModel extends RealEstateModel {
  final double priceForOneMounth; // تكلفة إجار الشهر الواحد
  final String lease; // عقد الإجار (سنوي أو شهري)

  RealEstateRentModel(
      {required super.realEastateType,
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
      required this.priceForOneMounth,
      required this.lease});
}
