class ProductModel {
  final int id;
  final String image;
  final double price;
  final String title;

  ProductModel({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      title: json['title'] ?? json['tite'] ?? 'No title',
    );
  }
}
