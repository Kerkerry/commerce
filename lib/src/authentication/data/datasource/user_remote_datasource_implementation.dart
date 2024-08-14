import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../../core/constants/api_endpoint_constants.dart';
import '../../../../core/errors/exception.dart';
import '../../../../core/helper/log_helper.dart';
import '../../../../core/typedef/typedef.dart';
import '../model/user_model.dart';
import 'user_remote_datasource.dart';

class UserRemoteDataSourceImplementation implements UserRemoteDataSource {
  const UserRemoteDataSourceImplementation(this._client);
  final http.Client _client;

  @override
  Future<void> createUser(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      final response = await _client.post(
          Uri.https(kBaseUrl, kCreateUserEndpoint),
          body: jsonEncode(
              {'username': userName, 'email': email, 'password': password}),
          headers: {'Content-Type': 'application/json'});

      if (response.statusCode != 200 || response.statusCode != 201) {
        logger.e("${response.statusCode}: ${response.body}");
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
  Future<List<UserModel>> getUsers() async {
    try {
      final response =
          await _client.get(Uri.https(kBaseUrl, kGetUsersEndpoint));

      if (response.statusCode != 200) {
        throw (APIException(
            message: response.body, statusCode: response.statusCode));
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((user) => UserModel.fromMap(user))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw (APIException(message: e.toString(), statusCode: 505));
    }
  }
}
