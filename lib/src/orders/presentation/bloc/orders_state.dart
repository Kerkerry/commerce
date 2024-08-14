part of 'orders_bloc.dart';

sealed class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object> get props => [];
}

final class OrdersInitial extends OrdersState {}

class CreatingOrderState extends OrdersState {
  const CreatingOrderState();
}

class OrderCreatedStated extends OrdersState {
  const OrderCreatedStated();
}

class OrderLoadingState extends OrdersState {
  const OrderLoadingState();
}

class OrderLoadedState extends OrdersState {
  final OrderClass order;
  const OrderLoadedState(this.order);
  @override
  List<Object> get props =>
      [order.orderId, order.userId, order.status, order.totalPrice];
}

class OrdersLoadingState extends OrdersState {
  const OrdersLoadingState();
}

class OrdersLoadedState extends OrdersState {
  final List<OrderClass> orders;
  const OrdersLoadedState(this.orders);
  @override
  List<Object> get props => orders.map((order) => order.orderId).toList();
}

class OrdersErrorState extends OrdersState {
  final String message;
  const OrdersErrorState(this.message);

  @override
  List<Object> get props => [message];
}
