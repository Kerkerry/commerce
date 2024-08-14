import 'package:flutter/material.dart';

import 'text_builder1_widget.dart';

class DrawerItemSectionWidget extends StatelessWidget {
  const DrawerItemSectionWidget(
      {super.key,
      required this.iconData,
      required this.title,
      required this.onTap});
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(iconData),
      title: BuildTextWidget(
          text: title,
          fontsize: 17,
          color: Colors.black.withOpacity(0.7),
          fontweight: FontWeight.w400),
    );
  }
}
