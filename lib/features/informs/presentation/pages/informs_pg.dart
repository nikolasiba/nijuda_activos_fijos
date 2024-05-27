import 'package:activosfijos/features/informs/presentation/controller/informs_controller.dart';
import 'package:activosfijos/shared/widgets/cusotm_appbar.dart';
import 'package:activosfijos/shared/widgets/custom_alert.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformsPage extends StatelessWidget {
  InformsPage({super.key});

  final controller = InformsController.findOrInitialize;
  @override
  Widget build(BuildContext context) {
    controller.getInforms();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Informes',
        goBack: true,
      ),
      body: Obx(
        () => controller.informs.isNotEmpty
            ? ListView.builder(
                itemCount: controller.informs.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    onTap: () {
                      CustomAlert(
                          title: 'Imagen del informe',
                          image: controller.informs[index].imagen!,
                          isNetworkImage: true);
                    },
                    leading: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.network(controller.informs[index].imagen!,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!
                                    : null,
                              ),
                            );
                          }
                        }, errorBuilder: (BuildContext context, Object error,
                                StackTrace? stackTrace) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                          );
                        })),
                    title: Text(
                        'Nombre: ${controller.informs[index].nombre ?? 'No hay nombre'}'),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Descripcion: ${controller.informs[index].descripcion ?? 'No hay descripcion'}'),
                        Text(
                            'Responsable: ${controller.informs[index].responsable ?? 'No hay responsable'}'),
                      ],
                    ),
                  );
                },
              )
            : const Center(
                child: Text('No hay informes disponibles'),
              ),
      ),
    );
  }
}
