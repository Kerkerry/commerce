import 'package:equatable/equatable.dart';

import 'exception.dart';

class Failure extends Equatable {
  const Failure({required this.message, required this.statusCode});
  final String message;
  final int statusCode;
  @override
  List<Object?> get props => [statusCode, message];
}

class APIFailure extends Failure {
  const APIFailure({required super.message, required super.statusCode});
  APIFailure.fromException(APIException e)
      : this(message: e.message, statusCode: e.statusCode);
}
