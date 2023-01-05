class Product {
  String? title, description, image;
  int? id;
  double? price;

  Product({
    this.id,
    this.title,
    this.price,
    this.image,
    this.description,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];

    description = json['description'] ?? "";
    price = double.parse(json['price'].toString());
    image = json['image'] ?? "";
  }
}
