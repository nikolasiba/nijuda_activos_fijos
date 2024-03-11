import 'package:activosfijos/shared/colors/colors.dart';
import 'package:activosfijos/shared/utils/responsive.dart';
import 'package:flutter/material.dart';

/// The BackgroundPage class is a stateless widget that displays a container with a background image and powered by nutresa.
class BackgroundPage extends StatelessWidget {
  const BackgroundPage({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Scaffold(
      body: Stack(
        children: [
          // Image.asset(
          //   Paths.images.background,
          //   fit: BoxFit.cover,
          //   width: responsive.width,
          //   height: responsive.height,
          // ),
          Container(
            color: MyColors.primaryGreen,
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: responsive.hp(5)),
          )
        ],
      ),
    );
  }
}
