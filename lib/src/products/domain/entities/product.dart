import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final int productId;
  final String name;
  final String description;
  final double price;
  final String unit;
  final String image;
  final int discount;
  final bool availability;
  final String category;
  final String brand;
  final double rating;
  final List? reviews;

  const Product({required this.productId, required this.name, required this.description, required this.price, required this.unit, required this.image, required this.discount, required this.availability, required this.category, required this.brand, required this.rating, required this.reviews});
  
  @override
  List<Object?> get props =>[productId,name,description,price,unit,image,discount,availability,category,brand,rating];
}