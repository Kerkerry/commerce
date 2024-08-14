import '../../../../core/typedef/typedef.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/product.dart';
import '../repos/product_repository.dart';

class GetProducts implements UseCaseWithoutParams<List<Product>> {
  final ProductRepository _repository;
  const GetProducts(this._repository);

  @override
  ResultFuture<List<Product>> call() async => _repository.getProducts();
}
