import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/typedef/typedef.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecase/create_product.dart';
import '../../domain/usecase/get_product.dart';

part 'prouduct_event.dart';
part 'prouduct_state.dart';

class ProuductBloc extends Bloc<ProuductEvent, ProuductState> {
  final GetProducts _getProducts;
  final CreateProduct _createProduct;
  ProuductBloc(
      {required GetProducts getProducts, required CreateProduct createProduct})
      : _getProducts = getProducts,
        _createProduct = createProduct,
        super(ProuductInitial()) {
    on<GetProductsEvent>(_getProductsHandler);
    on<CreateProductEvent>(_createProductHandler);
  }

  FutureOr<void> _getProductsHandler(
      GetProductsEvent event, Emitter<ProuductState> emit) async {
    emit(const ProductLoadingState());
    final result = await _getProducts();
    result.fold((failure) => emit(ProductErrorState(failure.message)),
        (products) => emit(ProductLoadedState(products)));
  }

  FutureOr<void> _createProductHandler(
      CreateProductEvent event, Emitter<ProuductState> emit) async {
    emit(const ProductCreatingState());
    final result = await _createProduct(ProductParams(
        productId: event.productId,
        name: event.name,
        description: event.description,
        price: event.price,
        unit: event.unit,
        image: event.image,
        discount: event.discount,
        availability: event.availability,
        category: event.category,
        brand: event.brand,
        rating: event.rating,
        reviews: event.reviews));

    result.fold((failure) => emit(ProductErrorState(failure.message)),
        (_) => const ProductCreatedState());
  }
}
