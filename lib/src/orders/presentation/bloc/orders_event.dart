part of 'orders_bloc.dart';

sealed class OrdersEvent extends Equatable {
  const OrdersEvent();

  @override
  List<Object> get props => [];
}

class CreateOrderEvent extends OrdersEvent {
  final int orderid;
  final int userid;
  final List<DataMap> items;
  final double totalprice;
  final String status;
  const CreateOrderEvent(
      {required this.orderid,
      required this.userid,
      required this.items,
      required this.totalprice,
      required this.status});
  @override
  List<Object> get props => [orderid, userid, totalprice, status];
}

class GetOrdersEvent extends OrdersEvent {
  const GetOrdersEvent();
}

class GetOrderEvent extends OrdersEvent {
  final int orderId;
  const GetOrderEvent(this.orderId);
  @override
  List<Object> get props => [orderId];
}
