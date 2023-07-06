class Product {
  final String? id;
  String? brand;
  final String? name;
  String? code;
  String? price;
  String? desc;
  String? imageDefault;
  String? imageFront;

  Product(
      {required this.name,
      required this.brand,
      required this.code,
      required this.desc,
      required this.price,
      required this.id,
      required this.imageDefault,
      required this.imageFront});
}
