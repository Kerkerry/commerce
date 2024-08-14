import 'package:equatable/equatable.dart';

import '../../../../core/typedef/typedef.dart';
import '../../../../core/usecases/usecases.dart';
import '../repositories/order_repository.dart';

class CreateOrder extends UseCaseWithParams<void, OrderParams> {
  final OrderRepository _repository;

  const CreateOrder(this._repository);

  @override
  ResultFuture<void> call(OrderParams params) async => _repository.createOrder(
      orderId: params.orderId,
      userId: params.userId,
      items: params.items,
      totalPrice: params.totalPrice,
      status: params.status);
}

class OrderParams extends Equatable {
  final int orderId;
  final int userId;
  final List<DataMap> items;
  final double totalPrice;
  final String status;

  const OrderParams(
      {required this.orderId,
      required this.userId,
      required this.items,
      required this.totalPrice,
      required this.status});
  @override
  List<Object?> get props => [orderId, userId, totalPrice, status];
}
