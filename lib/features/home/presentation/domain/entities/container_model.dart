import 'package:freezed_annotation/freezed_annotation.dart';

part 'container_model.freezed.dart';

@freezed
abstract class ContainerModel with _$ContainerModel {
  factory ContainerModel(
      {required String title,
      required String image,
      required void Function()? onTap}) = _ContainerModel;
}
