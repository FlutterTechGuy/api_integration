class Product {
  final int id;
  final String title;
  final num price;
  final String description;
  final String image;
  final String category;
  final Rating rating;

  Product(
      {required this.category,
      required this.description,
      required this.id,
      required this.image,
      required this.price,
      required this.title,
      required this.rating});

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "image": image,
        "category": category,
        "price": price,
        "description": description,
      };

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        category: json['category'],
        description: json['description'],
        id: json['id'],
        image: json['image'],
        price: json['price'],
        title: json['title'],
        rating: Rating.fromJson(json['rating']),
      );
}

class Rating {
  final num rating;
  final int count;

  Rating({
    required this.count,
    required this.rating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        count: json['count'],
        rating: json['rate'],
      );
}
