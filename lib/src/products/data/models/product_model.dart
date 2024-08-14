import 'dart:convert';

import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/product.dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.productId,
      required super.name,
      required super.description,
      required super.price,
      required super.unit,
      required super.image,
      required super.discount,
      required super.availability,
      required super.category,
      required super.brand,
      required super.rating,
      required super.reviews});

  ProductModel.fromMap(DataMap map)
      : this(
            productId: map['product_id'],
            name: map['name'],
            description: map['description'],
            price: map['price'],
            unit: map['unit'],
            image: map['image'],
            discount: map['discount'],
            availability: map['availability'],
            brand: map['brand'],
            category: map['category'],
            rating: map['rating'],
            reviews: map['reviews']);

  factory ProductModel.fromJson(String json) =>
      ProductModel.fromMap(jsonDecode(json) as DataMap);

  ProductModel copyWith({
    int? productId,
    String? name,
    String? description,
    double? price,
    String? unit,
    String? image,
    int? discount,
    bool? availability,
    String? category,
    String? brand,
    double? rating,
    List? reviews,
  }) {
    return ProductModel(
        productId: productId ?? this.productId,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        unit: unit ?? this.unit,
        image: image ?? this.image,
        discount: discount ?? this.discount,
        availability: availability ?? this.availability,
        category: category ?? this.category,
        brand: brand ?? this.brand,
        rating: rating ?? this.rating,
        reviews: reviews ?? this.reviews);
  }

  DataMap toMap() {
    return {
      'product_id': productId,
      'name': name,
      'description': description,
      'price': price,
      'unit': unit,
      'image': image,
      'discount': discount,
      'availability': availability,
      'category': category,
      'brand': brand,
      'rating': rating,
      'reviews': reviews
    };
  }

  String toJson() => jsonEncode(toMap());

  ProductModel.empty()
      : this(
            productId: 1,
            name: "name",
            description: 'description',
            price: 0.0,
            unit: 'unit',
            image: '',
            discount: 0,
            availability: false,
            category: 'category',
            brand: 'brand',
            rating: 0.0,
            reviews: []);
}
