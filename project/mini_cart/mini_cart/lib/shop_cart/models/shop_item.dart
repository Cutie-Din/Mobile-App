class Product {
  final int id;
  final String title;
  final double price;
  final String category;
  final String description;
  final String image;
  final int quantity;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      category: json['category'],
      description: json['description'],
      image: json['image'],
      quantity: 1, // Default initial quantity
    );
  }
  Product copyWith({int? quantity}) {
    return Product(
      id: id,
      title: title,
      price: price,
      image: image,
      category: category,
      description: description,
      quantity: quantity ?? this.quantity,
    );
  }
}
