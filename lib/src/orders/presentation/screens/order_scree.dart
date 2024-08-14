import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecases/usecases.dart';
import '../../../products/domain/entities/product.dart';
import '../../../products/presentation/bloc/prouduct_bloc.dart';
import '../../../products/presentation/widgets/loading_column.dart';
import '../../../products/presentation/widgets/product_card.dart';
import '../../domain/entities/order.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key, required this.order});
  final OrderClass order;

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  void getProducts() {
    context.read<ProuductBloc>().add(const GetProductsEvent());
  }

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Order"),
        ),
        body: BlocBuilder<ProuductBloc, ProuductState>(
          builder: (context, state) {
            if (state is ProductLoadingState) {
              return const LoadingColumn(message: "Fetching your order items");
            } else if (state is ProductLoadedState) {
              final List<Product> orderItems = OrderItems(
                      products: state.products, items: widget.order.items)
                  .getOrderItems;
              return ListView.builder(
                itemCount: orderItems.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: orderItems[index]);
                },
              );
            } else if (state is ProductErrorState) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}

// getOrderItems(itemsIds: getOrderProductIds(items: widget.order.items),products: state.products);