class Product {
  String? title, price, description, image;
  int? id;

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
    price = json['price'];
    image = json['image'] ?? "";
  }
}
