import '../../../../core/typedef/typedef.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrders extends UseCaseWithoutParams<List<OrderClass>> {
  final OrderRepository _repository;

  const GetOrders(this._repository);
  @override
  ResultFuture<List<OrderClass>> call() async => _repository.getOrders();
}
