import 'package:activosfijos/shared/colors/colors.dart';
import 'package:flutter/material.dart';

import 'package:activosfijos/shared/utils/responsive.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.content,
    this.width,
    this.height,
    this.color,
    this.borderRadius,
    this.padding,
  });
  final Widget content;
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    return Center(
      child: Container(
        padding: padding,
        height: height ?? responsive.dp(65),
        width: width ?? responsive.wp(85),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius ?? 20),
          color: color ?? MyColors.darkWhite,
        ),
        child: content,
      ),
    );
  }
}
