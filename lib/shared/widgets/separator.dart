import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Separator extends StatelessWidget {
  const Separator({Key? key, this.vertical = true, required this.size})
      : super(key: key);

  final bool vertical;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: vertical ? 0 : Get.width * (size / 100),
      height: vertical ? Get.height * (size / 100) : 0,
    );
  }
}
