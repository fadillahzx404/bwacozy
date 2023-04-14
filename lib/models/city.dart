class City {
  int id;
  String name;
  String ImageUrl;
  bool isPopular;

  City(
      {required this.id,
      required this.name,
      required this.ImageUrl,
      this.isPopular = false});
}
