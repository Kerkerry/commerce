import 'package:flutter/material.dart';

class BuildTextWidget extends StatelessWidget {
  const BuildTextWidget({super.key, required this.text, required this.fontsize, required this.color, required this.fontweight});
  final String text;
  final double fontsize;
  final Color color;
  final FontWeight fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(text, style:  TextStyle(color: color, fontSize: fontsize,fontWeight: fontweight),);
  }
}