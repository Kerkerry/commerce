import '../../domain/entities/product.dart';
import '../models/product_model.dart';

abstract class ProductRemoteDatasource {
  const ProductRemoteDatasource();
  Future createProduct(
      {required String name,
      required String description,
      required double price,
      required String unit,
      required String image,
      required int discount,
      required bool availability,
      required String category,
      required String brand,
      required double rating,
      required List reviews});
  Future<List<ProductModel>> getProducts();

  Future updateProduct({required int id, Product product});

  Future deleteProduct({required int id});
}
