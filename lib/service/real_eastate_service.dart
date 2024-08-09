import 'package:broker/models/real_estate_model.dart';

class RealEastateSaleService {
  static List<RealEstateSaleModel> allRealEstateSale = [];
  static List<RealEstateSaleModel> getAllRealEstateSale() {
    return allRealEstateSale;
  }
}

class RealEastateRentService {
  static List<RealEstateRentModel> allRealEstateRent = [];
  static List<RealEstateRentModel> getAllRealEstateRent() {
    return allRealEstateRent;
  }
}
