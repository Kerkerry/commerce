import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/constants/api_endpoint_constants.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/helper/log_helper.dart';
import '../../../../core/typedef/typedef.dart';
import '../model/order_model.dart';
import 'order_remote_datasource.dart';

class OrderRemoteDatasourceImplementation implements OrderRemoteDatasource {
  final http.Client _client;

  const OrderRemoteDatasourceImplementation(this._client);

  @override
  Future<void> createOrder(
      {required int userId,
      required List items,
      required double totalPrice,
      required String status}) async {
    try {
      final response = await _client.post(Uri.https(kBaseUrl, kOrdersEndpoint),
          body: jsonEncode({
            'user_id': userId,
            'items': items,
            'total_price': totalPrice,
            'status': status
          }),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode != 200 || response.statusCode != 201) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<OrderClassModel> getOrder({required int orderId}) async {
    try {
      final response = await _client
          .get(Uri.https(kBaseUrl, "$kOrdersEndpoint/order_id=$orderId"));
      logger.e(response.body);
      if (response.statusCode != 200 || response.statusCode != 201) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }

      return OrderClassModel.fromJson(response.body);
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<OrderClassModel>> getOrders() async {
    try {
      final response = await _client.get(Uri.https(kBaseUrl, kOrdersEndpoint));
      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }

      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((order) => OrderClassModel.fromMap(order))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
