import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
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

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Rating {
  final num rating;
  final int count;

  Rating({
    required this.count,
    required this.rating,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
