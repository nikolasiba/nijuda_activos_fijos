class ContainerModel {
  final String title;
  final String image;
  final void Function()? onTap;

  ContainerModel(
      {required this.title, required this.image, required this.onTap});
}
