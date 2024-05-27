import 'package:activosfijos/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.goBack});

  final String title;
  final bool? goBack;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: true,
        leading: goBack != null && goBack!
            ? IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            : Container(),
        backgroundColor: MyColors.primaryGreen,
        title: Text(
          title,
          style: TextStyle(color: MyColors.white),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
