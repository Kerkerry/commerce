import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/constants/api_endpoint_constants.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/helper/log_helper.dart';
import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/product.dart';
import '../models/product_model.dart';
import 'remote_datasource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDatasource {
  const ProductRemoteDataSourceImpl(this._client);
  final http.Client _client;
  @override
  Future createProduct(
      {required String name,
      required String description,
      required double price,
      required String unit,
      required String image,
      required int discount,
      required bool availability,
      required String category,
      required String brand,
      required double rating,
      required List reviews}) async {
    try {
      final response =
          await _client.post(Uri.https(kBaseUrl, kCreateProductEndPoint),
              body: jsonEncode({
                'name': name,
                'description': description,
                'price': price,
                'unit': unit,
                'image': image,
                'discount': discount,
                'availability': availability,
                'category': category,
                'brand': brand,
                'rating': rating,
                'reviews': reviews
              }),
              headers: {"Content-Type": "application/json"});
      if (response.statusCode != 200 || response.statusCode != 201) {
        logger.e(response.body);
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
    } on APIException {
      rethrow;
    } catch (e) {
      logger.e(e);
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future<List<ProductModel>> getProducts() async {
    try {
      final response =
          await _client.get(Uri.https(kBaseUrl, kGetProductsEndpoint));
      if (response.statusCode != 200) {
        logger.e(response.body);
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      final data = List<DataMap>.from(jsonDecode(response.body) as List)
          .map((product) => ProductModel.fromMap(product))
          .toList();
      return data;
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }

  @override
  Future deleteProduct({required int id}) async {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future updateProduct({required int id, Product? product}) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }
}
