import '../../../../core/typedef/typedef.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  const ProductRepository();

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
      required List<DataMap> reviews});
  ResultFuture<List<Product>> getProducts();

  ResultVoid updateProduct({required int id, Product product});

  ResultVoid deleteProduct({required int id});
}
