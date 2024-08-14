import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../../src/authentication/data/datasource/user_remote_datasource.dart';
import '../../src/authentication/data/datasource/user_remote_datasource_implementation.dart';
import '../../src/authentication/data/repositories/user_repository_implementation.dart';
import '../../src/authentication/domain/repositories/user_repository.dart';
import '../../src/authentication/domain/usecases/create_user.dart';
import '../../src/authentication/domain/usecases/get_users.dart';
import '../../src/authentication/presentation/bloc/authenticate_user_bloc.dart';
import '../../src/authentication/presentation/bloc/user_bloc.dart';
import '../../src/orders/data/datasources/order_remote_datasource.dart';
import '../../src/orders/data/datasources/order_remote_datasource_implementation.dart';
import '../../src/orders/data/repository/order_repository_implementation.dart';
import '../../src/orders/domain/repositories/order_repository.dart';
import '../../src/orders/domain/usecases/create_order.dart';
import '../../src/orders/domain/usecases/get_order.dart';
import '../../src/orders/domain/usecases/get_orders.dart';
import '../../src/orders/presentation/bloc/orders_bloc.dart';
import '../../src/products/data/datasource/remote_datasource.dart';
import '../../src/products/data/datasource/remote_datasource_implementation.dart';
import '../../src/products/data/repos/product_repository_implementation.dart';
import '../../src/products/domain/repos/product_repository.dart';
import '../../src/products/domain/usecase/create_product.dart';
import '../../src/products/domain/usecase/get_product.dart';
import '../../src/products/presentation/bloc/prouduct_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // User login
  sl
    ..registerFactory(() => AuthenticateUserBloc(getUsers: sl()))
    // User
    ..registerFactory(() => UserBloc(createUser: sl(), getUsers: sl()))
    ..registerLazySingleton(() => CreateUser(sl()))
    ..registerLazySingleton(() => GetUsers(sl()))
    ..registerLazySingleton<UserRepository>(
        () => UserRepositoryImplementation(sl()))
    ..registerLazySingleton<UserRemoteDataSource>(
        () => UserRemoteDataSourceImplementation(sl()))
// Products
    ..registerFactory(
        () => ProuductBloc(getProducts: sl(), createProduct: sl()))
    ..registerLazySingleton(() => CreateProduct(sl()))
    ..registerLazySingleton(() => GetProducts(sl()))
    ..registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImplemetation(sl()))
    ..registerLazySingleton<ProductRemoteDatasource>(
        () => ProductRemoteDataSourceImpl(sl()))
    // oders
    ..registerFactory(
        () => OrdersBloc(getOrders: sl(), getOrder: sl(), createOrder: sl()))
    ..registerLazySingleton(() => GetOrders(sl()))
    ..registerLazySingleton(() => GetOrder(sl()))
    ..registerLazySingleton(() => CreateOrder(sl()))
    ..registerLazySingleton<OrderRepository>(
        () => OrderRepositoryImplementation(sl()))
    ..registerLazySingleton<OrderRemoteDatasource>(
        () => OrderRemoteDatasourceImplementation(sl()))
    ..registerLazySingleton(() => http.Client());
}
