import 'package:activosfijos/features/informs/presentation/controller/informs_controller.dart';
import 'package:activosfijos/shared/widgets/cusotm_appbar.dart';
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
        () => ListView.builder(
          itemCount: controller.informs.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
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
                          value: loadingProgress.expectedTotalBytes != null
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
              title: Text('Nombre: ${controller.informs[index].nombre!}'),
              subtitle: Text(
                  'Descripcion: ${controller.informs[index].descripcion!}'),
            );
          },
        ),
      ),
    );
  }
}
