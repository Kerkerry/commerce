part of 'prouduct_bloc.dart';

sealed class ProuductState extends Equatable {
  const ProuductState();

  @override
  List<Object> get props => [];
}

final class ProuductInitial extends ProuductState {}

class ProductLoadingState extends ProuductState {
  const ProductLoadingState();
}

class ProductLoadedState extends ProuductState {
  final List<Product> products;
  const ProductLoadedState(this.products);

  @override
  List<Object> get props =>
      products.map((product) => product.productId).toList();
}

class ProductCreatingState extends ProuductState {
  const ProductCreatingState();
}

class ProductCreatedState extends ProuductState {
  const ProductCreatedState();
}

class ProductErrorState extends ProuductState {
  final String message;
  const ProductErrorState(this.message);

  @override
  List<String> get props => [message];
}
