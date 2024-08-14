import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/product.dart';
import '../../domain/repos/product_repository.dart';
import '../datasource/remote_datasource.dart';

class ProductRepositoryImplemetation implements ProductRepository {
  const ProductRepositoryImplemetation(this._remoteDatasource);

  final ProductRemoteDatasource _remoteDatasource;

  @override
  ResultVoid createProduct(
      {required int productId,
      required String name,
      required String description,
      required double price,
      required String unit,
      required String image,
      required int discount,
      required bool availability,
      required String category,
      required String brand,
      required double rating,
      required List<DataMap> reviews}) async {
    try {
      await _remoteDatasource.createProduct(
          name: name,
          description: description,
          price: price,
          unit: unit,
          image: image,
          discount: discount,
          availability: availability,
          category: category,
          brand: brand,
          rating: rating,
          reviews: reviews);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid deleteProduct({required int id}) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<Product>> getProducts() async {
    try {
      final response = await _remoteDatasource.getProducts();
      return Right(response);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultVoid updateProduct({required int id, Product? product}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
