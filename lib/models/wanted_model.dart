import 'package:intl/intl.dart';

class WantedModel {
  final String type;
  final String city;
  final String region;
  final String budget;
  final String descriptionOfWanted;
  final String phoneNumber;
  final String date;
  final int id;

  WantedModel({
    required this.id,
    required this.type,
    required this.city,
    required this.region,
    required this.budget,
    required this.descriptionOfWanted,
    required this.phoneNumber,
    required this.date,
  });
}
