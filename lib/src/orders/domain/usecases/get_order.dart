import '../../../../core/typedef/typedef.dart';
import '../../../../core/usecases/usecases.dart';
import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrder extends UseCaseWithParams<OrderClass, int> {
  final OrderRepository _repository;
  const GetOrder(this._repository);

  @override
  ResultFuture<OrderClass> call(int params) async =>
      _repository.getOrder(orderid: params);
}
