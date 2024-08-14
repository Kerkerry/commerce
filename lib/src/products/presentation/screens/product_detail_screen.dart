import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product x"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(product.name),
      ),
    );
  }
}
