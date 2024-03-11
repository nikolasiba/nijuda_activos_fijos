import 'package:flutter/material.dart';
import 'package:activosfijos/shared/colors/colors.dart';

import 'package:activosfijos/shared/utils/responsive.dart';

/// The CustomPrimaryButton class is a stateless widget that displays a
/// The CustomPrimaryButton class is a stateless widget that displays a
/// filled button with a text and an onPressed callback.
class CustomPrimaryButton extends StatelessWidget {
  const CustomPrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.height,
    this.width,
    this.textStyle,
    this.color,
  }) : super(key: key);

  final String text;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive.of(context);
    return FilledButton(
      style: FilledButton.styleFrom(
          disabledBackgroundColor: MyColors.lightGray,
          elevation: 3,
          backgroundColor: color ?? MyColors.blueGreen,
          minimumSize:
              Size(width ?? responsive.wp(77), height ?? responsive.hp(5.9)),
          textStyle: textStyle
          // TextStyles.dynamicTextStyle(
          //   isBold: true,
          //   color: MyColors.white,
          //   fontFamily: Fonts.montserratExtraBold,
          //   fontSize: responsive.fp(16),
          // )
          ),
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
