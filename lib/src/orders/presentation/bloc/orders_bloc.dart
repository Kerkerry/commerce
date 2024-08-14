import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/order.dart';
import '../../domain/usecases/create_order.dart';
import '../../domain/usecases/get_order.dart';
import '../../domain/usecases/get_orders.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final GetOrders _getOrders;
  final GetOrder _getOrder;
  final CreateOrder _createOrder;
  OrdersBloc(
      {required GetOrders getOrders,
      required GetOrder getOrder,
      required CreateOrder createOrder})
      : _getOrders = getOrders,
        _getOrder = getOrder,
        _createOrder = createOrder,
        super(OrdersInitial()) {
    on<CreateOrderEvent>(_createOrdersHandler);
    on<GetOrderEvent>(_getOrderHandler);
    on<GetOrdersEvent>(_getOrdersHandler);
  }

  FutureOr<void> _createOrdersHandler(
      CreateOrderEvent event, Emitter<OrdersState> emit) async {
    emit(const CreatingOrderState());
    final result = await _createOrder(OrderParams(
        orderId: event.orderid,
        userId: event.userid,
        items: event.items,
        totalPrice: event.totalprice,
        status: event.status));

    result.fold((failure) => emit(OrdersErrorState(failure.message)),
        (_) => emit(const OrderCreatedStated()));
  }

  FutureOr<void> _getOrderHandler(
      GetOrderEvent event, Emitter<OrdersState> emit) async {
    emit(const OrderLoadingState());
    // final result = await _getOrder(event.orderId);
    // result.fold((failure) => emit(OrdersErrorState(failure.message)),
    //     (order) => emit(OrderLoadedState(order)));
    final result = await _getOrders();
    result.fold((failure) => emit(OrdersErrorState(failure.message)), (orders) {
      final order = orders[event.orderId - 1];
      emit(OrderLoadedState(order));
    });
  }

  FutureOr<void> _getOrdersHandler(
      GetOrdersEvent event, Emitter<OrdersState> emit) async {
    emit(const OrdersLoadingState());
    final result = await _getOrders();
    result.fold((failure) => emit(OrdersErrorState(failure.message)), (orders) {
      emit(OrdersLoadedState(orders));
    });
  }
}
