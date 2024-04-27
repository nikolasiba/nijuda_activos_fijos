import 'package:activosfijos/features/home/presentation/domain/entities/container_model.dart';
import 'package:activosfijos/shared/assets/assets.dart';
import 'package:activosfijos/shared/colors/colors.dart';
import 'package:activosfijos/shared/widgets/cuistom_container_options.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyColors.primaryGreen,
          title: const Text('Que deseas hacer hoy?'),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          )),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: containerModels.length,
          itemBuilder: (BuildContext context, int index) {
            return CustomContainerOptions(
                containerModel: containerModels[index]);
          },
        ),
      ),
    );
  }
}

final List<ContainerModel> containerModels = [
  ContainerModel(
    image: Res.images.registers,
    title: 'Registrar',
    onTap: () {},
  ),
  ContainerModel(
    image: Res.images.registers,
    title: 'generar placa',
    onTap: () {},
  ),
  ContainerModel(
    image: Res.images.registers,
    title: 'Informes',
    onTap: () {},
  ),
  ContainerModel(
    image: Res.images.registers,
    title: 'Indicadores',
    onTap: () {},
  ),
];
