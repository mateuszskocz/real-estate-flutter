class House {
  final int id;
  final String title;
  final String location;
  final String link;
  final double? surface;
  final String createdAt;
  final String lastPriceChangedAt;
  final String lastSeenAt;

  House(this.id, this.title, this.location, this.link, this.surface,
      this.createdAt, this.lastPriceChangedAt, this.lastSeenAt);

  factory House.fromJson(var json) {
    return House(
        json['id'],
        json['title'],
        json['location'],
        json['link'],
        json['surface'],
        json['createdAt'],
        json['lastPriceChangedAt'],
        json['lastSeenAt']);
  }
}
