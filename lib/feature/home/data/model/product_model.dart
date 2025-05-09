class ProductModel {
  final String categoryName;
  final String name;
  final double price;
  final String image;
  final String details;
  final int amountItem;

  ProductModel({
    required this.categoryName,
    required this.name,
    required this.price,
    required this.image,
    required this.details,
    required this.amountItem,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      categoryName: json['category_name'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      image: json['image_url'] ?? '',
      details: json['details'] ?? '',
      amountItem: json['amount_item'] ?? 0,
    );
  }

  ProductModel toEntity() {
    return ProductModel(
      categoryName: categoryName,
      name: name,
      price: price,
      image: image,
      details: details,
      amountItem: amountItem,
    );
  }
}
