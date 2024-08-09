import 'package:broker/helper/api.dart';
import 'package:broker/models/wanted_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WantedService {
  final Api api = Api();
  Future<List<WantedModel>> getAllWanted() async {
    List<WantedModel> allSaleWanted = [];
    const String url =
        "https://bba2-185-107-56-165.ngrok-free.app/api/sale-orders";

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');
      print(token.toString());
      dynamic data = await api.get(
        url: url,
        token: token.toString(),
      );

      List<dynamic> jsonAllSaleWanted = data['date'];
      for (Map wanted in jsonAllSaleWanted) {
        allSaleWanted.add(WantedModel(
            id: wanted['id'],
            date: wanted['created_at'],
            type: wanted['type'],
            city: wanted['city'],
            region: wanted['region'],
            budget: wanted['budget'],
            descriptionOfWanted: wanted['description'],
            phoneNumber: wanted['phone']));
      }
      return allSaleWanted;
    } catch (e) {
      return allSaleWanted;
    }
  }

  Future<String> addWanted({
    required String city,
    required String region,
    required String budget,
    required String phone,
    required String description,
    required String type,
  }) async {
    const String url =
        "https://bba2-185-107-56-165.ngrok-free.app/api/add-orders";
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');
      print(token.toString());
      dynamic data = await api.post(
        url: url,
        body: {
          'city': city,
          'region': region,
          'budget': budget,
          'phone': phone,
          'description': description,
          'type': type,
        },
        token: token.toString(),
      );
      return data;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
