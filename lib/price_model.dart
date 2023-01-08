class Price {
  final double price;
  final String createdAt;

  Price(this.price, this.createdAt);

  factory Price.fromJson(var json) {
    return Price(
        json['price'],
        json['createdAt']);
  }
}
