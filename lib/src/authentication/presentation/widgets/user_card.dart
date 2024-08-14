import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import 'text_builder1_widget.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 14, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTextWidget(
                  text: user.userName,
                  fontsize: 18,
                  color: Colors.grey,
                  fontweight: FontWeight.w500),
              const SizedBox(
                height: 10,
              ),
              BuildTextWidget(
                  text: user.email,
                  fontsize: 16,
                  color: Colors.black.withOpacity(0.8),
                  fontweight: FontWeight.w300),
              const SizedBox(
                height: 10,
              ),
              BuildTextWidget(
                  text: user.password,
                  fontsize: 15,
                  color: Colors.black,
                  fontweight: FontWeight.w600)
            ],
          ),
        ));
  }
}
