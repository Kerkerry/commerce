import 'package:equatable/equatable.dart';

class OrderClass extends Equatable{
  final int orderId;
  final int userId;
  final List items;
  final double totalPrice;
  final String status;

  const OrderClass({required this.orderId, required this.userId, required this.items, required this.totalPrice, required this.status});
  @override
  List<Object?> get props => [orderId,userId,totalPrice,status];

}