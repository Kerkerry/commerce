import 'dart:convert';

import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/order.dart';

class OrderClassModel extends OrderClass {
  const OrderClassModel(
      {required super.orderId,
      required super.userId,
      required super.items,
      required super.totalPrice,
      required super.status});

  OrderClassModel.fromMap(DataMap map)
      : this(
            orderId: map['order_id'],
            userId: map['user_id'],
            items: map['items'],
            totalPrice: map['total_price'],
            status: map['status']);

  factory OrderClassModel.fromJson(String json) =>
      OrderClassModel.fromMap(jsonDecode(json) as DataMap);

  OrderClassModel copyWith(
      {int? orderId,
      int? userId,
      List? items,
      double? totalPrice,
      String? status}) {
    return OrderClassModel(
        orderId: orderId ?? this.orderId,
        userId: userId ?? this.userId,
        items: items ?? this.items,
        totalPrice: totalPrice ?? this.totalPrice,
        status: status ?? this.status);
  }

  DataMap toMap() {
    return {
      'order_id': orderId,
      'user_id': userId,
      'items': items,
      'total_price': totalPrice,
      'status': status
    };
  }

  String toJson() => jsonEncode(toMap());
}
