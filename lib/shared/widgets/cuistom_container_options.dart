import 'package:activosfijos/features/home/presentation/domain/entities/container_model.dart';
import 'package:activosfijos/shared/colors/colors.dart';
import 'package:flutter/material.dart';

class CustomContainerOptions extends StatelessWidget {
  const CustomContainerOptions({super.key, required this.containerModel});

  final ContainerModel containerModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: containerModel.onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: MyColors.primaryGreen,
            width: 1,
          ),
        ),
        child: Center(
            child: Column(
          children: [
            Image.asset(
              containerModel.image,
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 10),
            Text(
              containerModel.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )),
      ),
    );
  }
}
