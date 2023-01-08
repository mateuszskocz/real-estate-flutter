import 'house_model.dart';

class HousePage {
  final List<House> houses;
  final int totalPages;
  final int number;

  HousePage(this.houses, this.totalPages, this.number);

  factory HousePage.fromJson(Map<String, dynamic> json){
    List<dynamic> content = json['content'];

    List<House> houses = [];
    for (var rawHouse in content) {
      var house = House.fromJson(rawHouse);
      houses.add(house);
    }
    return HousePage(houses, json['totalPages'], json['number']);
  }
}
