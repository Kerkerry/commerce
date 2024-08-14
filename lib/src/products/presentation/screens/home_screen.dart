import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../authentication/domain/entities/user.dart';
import '../../../authentication/presentation/widgets/app_drawer_widget.dart';
import '../../domain/entities/product.dart';
import '../bloc/prouduct_bloc.dart';
import '../widgets/loading_column.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final User user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void getProducts() {
    context.read<ProuductBloc>().add(const GetProductsEvent());
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProuductBloc, ProuductState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text("Products"),
              centerTitle: true,
              actions: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.trolley))
              ],
            ),
            drawer: AppDrawerWidget(
              user: widget.user,
            ),
            body: state is ProductLoadingState
                ? const LoadingColumn(message: "Fetching products")
                : state is ProductLoadedState
                    ? ListView.builder(
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final Product product = state.products[index];
                          return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ProductDetailScreen(
                                          product: product,
                                        )));
                              },
                              child: ProductCard(product: product));
                        })
                    : state is ProductErrorState
                        ? Center(
                            child: Text(state.message),
                          )
                        : const SizedBox.shrink());
      },
    );
  }
}
