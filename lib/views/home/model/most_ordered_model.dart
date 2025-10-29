class MostOrderedModel {
  final int id;
  final String image;
  final double price;
  final String title;

  MostOrderedModel({
    required this.id,
    required this.image,
    required this.price,
    required this.title,
  });

  factory MostOrderedModel.fromJson(Map<String, dynamic> json) {
    return MostOrderedModel(
      id: json['id'] ?? 0,
      image: json['image'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      title: json['title'] ?? json['tite'] ?? 'No title',
    );
  }
}
