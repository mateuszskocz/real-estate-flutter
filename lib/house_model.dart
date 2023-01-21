import 'package:real_estate_flutter/price_model.dart';

class House {
  final int id;
  final String title;
  final String location;
  final String link;
  final double? surface;
  final String createdAt;
  final String lastPriceChangedAt;
  final String lastSeenAt;
  final List<Price> prices;
  final String? imageBase64;

  House(
      this.id,
      this.title,
      this.location,
      this.link,
      this.surface,
      this.createdAt,
      this.lastPriceChangedAt,
      this.lastSeenAt,
      this.prices,
      this.imageBase64);

  factory House.fromJson(var json) {
    List<dynamic> rawPrices = json['prices'];
    List<Price> prices = [];
    for (var rawPrice in rawPrices) {
      var price = Price.fromJson(rawPrice);
      prices.add(price);
    }
    return House(
        json['id'],
        json['title'],
        json['location'],
        json['link'],
        json['surface'],
        json['createdAt'],
        json['lastPriceChangedAt'],
        json['lastSeenAt'],
        prices,
        json['imageBase64']);
  }
}
