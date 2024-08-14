import '../../src/products/domain/entities/product.dart';
import '../typedef/typedef.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();
  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<Type> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}

class OrderItems {
  final List<Product> products;
  final List items;

  const OrderItems({required this.products, required this.items});

  List<Product> get getOrderItems {
    final List<Product> items = [];
    for (int i = 0; i < getOrderProductIds.length; i++) {
      for (int j = 0; j < products.length; j++) {
        if (products[j].productId == getOrderProductIds[i]) {
          items.add(products[j]);
        }
      }
    }
    return items;
  }

  List<int> get getOrderProductIds {
    final List<int> ids =
        items.map((item) => item['product_id'] as int).toList();
    return ids;
  }
}
