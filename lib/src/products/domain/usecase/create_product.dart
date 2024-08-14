import 'package:equatable/equatable.dart';

import '../../../../core/typedef/typedef.dart';
import '../../../../core/usecases/usecases.dart';
import '../repos/product_repository.dart';

class CreateProduct implements UseCaseWithParams<void, ProductParams> {
  const CreateProduct(this._repository);
  final ProductRepository _repository;

  @override
  ResultFuture<void> call(ProductParams params) async =>
      _repository.createProduct(
          productId: params.productId,
          name: params.name,
          description: params.description,
          price: params.price,
          unit: params.unit,
          image: params.image,
          discount: params.discount,
          availability: params.availability,
          category: params.category,
          brand: params.brand,
          rating: params.rating,
          reviews: params.reviews);
}

class ProductParams extends Equatable {
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

  const ProductParams(
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

  @override
  List<Object?> get props => [
        productId,
        name,
        description,
        price,
        unit,
        image,
        discount,
        availability,
        category,
        brand,
        rating
      ];
}
