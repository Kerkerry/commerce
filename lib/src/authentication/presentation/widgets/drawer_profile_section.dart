import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';
import 'text_builder1_widget.dart';

class DrawerProfileSectionWidget extends StatelessWidget {
  const DrawerProfileSectionWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: const Icon(
        Icons.person,
        size: 50,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildTextWidget(
              text: user.userName,
              fontsize: 19,
              color: Colors.black.withOpacity(0.7),
              fontweight: FontWeight.w500),
          BuildTextWidget(
              text: user.email,
              fontsize: 17,
              color: Colors.black.withOpacity(0.5),
              fontweight: FontWeight.w400),
        ],
      ),
    );
  }
}
