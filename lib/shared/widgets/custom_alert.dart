import 'package:activosfijos/shared/widgets/separator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:activosfijos/shared/assets/assets.dart';
import 'package:activosfijos/shared/colors/colors.dart';

class CustomAlert {
  final String title;
  final TextStyle? textStyleTitle;
  final String? body;
  final TextStyle? textStyleBody;
  final String? text1;
  final TextStyle? textStyleText1;
  final String? text2;
  final TextStyle? textStyleText2;
  final bool? barrierDismissible;
  final double? width;
  final double? height;
  final VoidCallback? onPressed;
  final String? image;
  final bool? isTelephone;
  final double? iconSize;
  final TextStyle? style;

  CustomAlert(
      {required this.title,
      this.barrierDismissible,
      this.width,
      this.height,
      this.body,
      this.onPressed,
      this.image,
      this.text1,
      this.text2,
      this.isTelephone,
      this.textStyleTitle,
      this.textStyleBody,
      this.textStyleText1,
      this.textStyleText2,
      this.iconSize,
      this.style}) {
    showAlertDialog();
  }

  showAlertDialog() {
    Get.dialog(
        PopScope(
          canPop: false,
          child: BodyAlert(
            height: height,
            width: width,
            onPressed: onPressed,
            title: title,
            image: image,
            body: body,
            text1: text1,
            text2: text2,
            isTelephone: isTelephone,
            textStyleTitle: textStyleTitle,
            textStyleBody: textStyleBody,
            textStyleText1: textStyleText1,
            textStyleText2: textStyleText2,
            iconSize: iconSize,
            style: style,
          ),
        ),
        barrierDismissible:
            barrierDismissible != null ? barrierDismissible! : false);
  }
}

class BodyAlert extends StatelessWidget {
  const BodyAlert({
    Key? key,
    this.height,
    this.width,
    required this.onPressed,
    required this.title,
    this.image,
    this.body,
    this.text1,
    this.text2,
    this.isTelephone,
    this.textStyleTitle,
    this.textStyleBody,
    this.textStyleText1,
    this.textStyleText2,
    this.iconSize,
    this.style,
  }) : super(key: key);

  final double? height;
  final double? width;
  final VoidCallback? onPressed;
  final String title;
  final TextStyle? textStyleTitle;
  final String? image;
  final String? body;
  final TextStyle? textStyleBody;
  final String? text1;
  final TextStyle? textStyleText1;
  final String? text2;
  final TextStyle? textStyleText2;
  final bool? isTelephone;
  final double? iconSize;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    const double heightSepartor = 2;

    return Center(
      child: BounceInUp(
        duration: const Duration(milliseconds: 500),
        child: SizedBox(
          height: height ?? Get.height * 0.5,
          width: width ?? Get.width * 0.8,
          child: Card(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: onPressed ?? () => Get.back(),
                      icon: Icon(Icons.cancel, color: MyColors.black),
                      iconSize: iconSize ?? Get.width * 0.08),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: Get.width * 0.05,
                        left: Get.width * 0.1,
                        right: Get.width * 0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: textStyleTitle ??
                              TextStyle(
                                  color: MyColors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const Separator(size: heightSepartor),
                        Expanded(
                          child: Image.asset(
                            image ?? Res.images.errorImage,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const Separator(size: heightSepartor),
                        if (body != null)
                          Text(
                            body!,
                            // style: textStyleBody ??
                            //     TextStyles.dynamicAileron(
                            //         percentageFontsize: 1.5,
                            //         isBold: true,
                            //         color: Colores.mediumGray),
                            textAlign: TextAlign.center,
                          ),
                        if (body != null) const Separator(size: heightSepartor),
                        if (text1 != null)
                          Text(
                            text1!,
                            // style: textStyleText1 ??
                            //     TextStyles.dynamicAileron(
                            //         percentageFontsize: 1.85,
                            //         isBold: false,
                            //         color: Colores.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        if (text1 != null)
                          const Separator(size: heightSepartor),
                        if (text2 != null)
                          Text(
                            text2!,
                            // style: textStyleText2 ??
                            //     TextStyles.dynamicAileron(
                            //       percentageFontsize: 1.85,
                            //       isBold: false,
                            //       color: Colores.mediumGray,
                            //     ),
                            textAlign: TextAlign.center,
                          ),
                        // if (isTelephone ?? false)
                        //   Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       TextButton.icon(
                        //         onPressed: () async {
                        //           Util.device.launchPhoneCall();
                        //         },
                        //         icon: Row(
                        //           children: [
                        //             Icon(
                        //               Icons.phone,
                        //               color: Colores.blackColor,
                        //               size: 30,
                        //             ),
                        //           ],
                        //         ),
                        //         label: Text(
                        //           Messages.appText.phoneCall,
                        //           style: style ??
                        //               TextStyles.titleAppbar(
                        //                   isBold: true,
                        //                   color: Colores.mediumGray),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ),
                        //     ],
                        //   )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
