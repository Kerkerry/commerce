import 'package:flutter/material.dart';

import '../../domain/entities/product.dart';
import 'rating_bar.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double w = size.width;
    return Card(
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            height: w * 0.3,
            width: w * 0.3,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: w * 0.6,
                  child: Text(
                    product.description,
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.75)),
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    "\$",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${product.price}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 6),
                width: w * 0.2,
                decoration: BoxDecoration(
                    color: Colors.green[300],
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Row(
                  children: [
                    Text(
                      "Save ${product.discount}",
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "%",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              product.availability
                  ? Text(
                      "Product is available",
                      style: TextStyle(
                          fontSize: 18, color: Colors.black.withOpacity(0.4)),
                    )
                  : Text(
                      "Product is available",
                      style: TextStyle(
                          fontSize: 18, color: Colors.black.withOpacity(0.6)),
                    ),
              const SizedBox(
                height: 10,
              ),
              RatingBarIndicatorWidget(product: product),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  child: const Text(
                    "Add to Cart",
                    style: TextStyle(fontSize: 18),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
