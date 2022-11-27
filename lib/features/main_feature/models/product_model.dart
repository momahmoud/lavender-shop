class ProductModel {
  final int id;
  final String? name;
  final String? title;
  final String description;
  final String? category;
  final String? image;
  final String? brand;
  final String? thumbnail;
  final dynamic price;
  final dynamic oldPrice;
  final dynamic discount;
  final dynamic discountPercentage;
  final List<String>? images;
  final dynamic rating;
  final dynamic stock;
  final dynamic inFavorites;
  final dynamic inCart;

  ProductModel({
    required this.id,
    this.name,
    required this.description,
    this.image,
    this.price,
    this.oldPrice,
    this.discount,
    this.images,
    this.inFavorites,
    this.inCart,
    this.brand,
    this.title,
    this.thumbnail,
    this.rating,
    this.stock,
    this.category,
    this.discountPercentage,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'] ?? "",
      description: json['description'],
      image: json['image'] ?? "",
      price: json['price'] ?? "",
      oldPrice: json['old_price'] ?? "",
      discount: json['discount'] ?? "",
      images: List<String>.from(json['images'].map((e) => e)),
      inFavorites: json['in_favorites'] ?? "",
      inCart: json['in_cart'] ?? "",
      brand: json['brand'] ?? "",
      discountPercentage: json["discountPercentage"] ?? "",
      rating: json["rating"] ?? "",
      stock: json['stock'] ?? "",
      thumbnail: json['thumbnail'] ?? "",
      title: json["title"] ?? "",
      category: json['category'] ?? "",
    );
  }
}
