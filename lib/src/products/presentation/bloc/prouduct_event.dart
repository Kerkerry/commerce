part of 'prouduct_bloc.dart';

sealed class ProuductEvent extends Equatable {
  const ProuductEvent();

  @override
  List<Object> get props => [];
}

class GetProductsEvent extends ProuductEvent {
  const GetProductsEvent();
}

class CreateProductEvent extends ProuductEvent {
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
  final List<DataMap> reviews;
  const CreateProductEvent(
      {required this.productId,
      required this.name,
      required this.description,
      required this.price,
      required this.unit,
      required this.image,
      required this.discount,
      required this.availability,
      required this.category,
      required this.brand,
      required this.rating,
      required this.reviews});
}
