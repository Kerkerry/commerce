import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_remote_datasource.dart';

class OrderRepositoryImplementation implements OrderRepository {
  final OrderRemoteDatasource _datasource;
  OrderRepositoryImplementation(this._datasource);

  @override
  ResultVoid createOrder(
      {required int orderId,
      required int userId,
      required List items,
      required double totalPrice,
      required String status}) async {
    try {
      await _datasource.createOrder(
          userId: userId, items: items, totalPrice: totalPrice, status: status);
      return const Right(null);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<OrderClass> getOrder({required int orderid}) async {
    try {
      final response = await _datasource.getOrder(orderId: orderid);
      return Right(response);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<OrderClass>> getOrders() async {
    try {
      final response = await _datasource.getOrders();
      return Right(response);
    } on APIException catch (e) {
      return Left(APIFailure.fromException(e));
    }
  }
}
