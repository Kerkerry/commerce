import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/product.dart';

class RatingBarIndicatorWidget extends StatelessWidget {
  const RatingBarIndicatorWidget({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: product.rating,
        itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
        itemCount: 5,
        itemSize: 30.0,
        unratedColor: Colors.amber.withAlpha(50),
        direction: Axis.horizontal);
  }
}
