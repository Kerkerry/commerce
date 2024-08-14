import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingColumn extends StatelessWidget {
  const LoadingColumn({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CupertinoActivityIndicator(),
          Text(message,style: TextStyle(fontSize: 18, color: Colors.black.withOpacity(0.7)),)
        ],
      ),
    );
  }
}