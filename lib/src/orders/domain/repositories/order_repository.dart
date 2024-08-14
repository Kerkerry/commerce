import '../../../../core/typedef/typedef.dart';
import '../entities/order.dart';

abstract class OrderRepository {
  const OrderRepository();

  ResultFuture<List<OrderClass>> getOrders();

  ResultFuture<OrderClass> getOrder({required int orderid});

  ResultVoid createOrder(
      {required int orderId,
      required int userId,
      required List<DataMap> items,
      required double totalPrice,
      required String status});
}
