import '../model/order_model.dart';

abstract class OrderRemoteDatasource {
  const OrderRemoteDatasource();

  Future<void> createOrder(
      {required int userId,
      required List items,
      required double totalPrice,
      required String status});
  Future<List<OrderClassModel>> getOrders();

  Future<OrderClassModel> getOrder({required int orderId});
}
