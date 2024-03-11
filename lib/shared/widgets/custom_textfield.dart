import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:activosfijos/shared/colors/colors.dart';

import 'package:activosfijos/shared/utils/responsive.dart';

/// The CustomTextField class is a stateful widget that displays a
/// custom textfield according to the design.
class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.keyboardType,
      this.enableInteractiveSelection = true,
      this.enabled = true,
      this.obscureText = false,
      this.prefixIcon,
      this.maxLength,
      this.onChanged,
      this.contextMenuBuilder,
      this.inputFormatters,
      this.hintTextStyle,
      this.fillColor,
      this.withShadow = true,
      this.borderSide,
      this.labelText});

  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final bool enableInteractiveSelection;
  final bool enabled;
  final bool obscureText;
  final Widget? prefixIcon;
  final int? maxLength;
  final Function(String)? onChanged;
  final Widget Function(BuildContext, EditableTextState)? contextMenuBuilder;
  final List<TextInputFormatter>? inputFormatters;
  final TextStyle? hintTextStyle;
  final Color? fillColor;
  final bool withShadow;
  final BorderSide? borderSide;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureTextState;

  @override
  void initState() {
    super.initState();
    _obscureTextState = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return TextField(
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: _obscureTextState,
      maxLines: 1,
      maxLength: widget.maxLength,
      buildCounter: (BuildContext context,
              {int? currentLength, int? maxLength, bool? isFocused}) =>
          null,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      contextMenuBuilder: widget.contextMenuBuilder,
      onChanged: widget.onChanged,
      enabled: widget.enabled,
      decoration: InputDecoration(
          labelText: widget.labelText,
          focusColor: MyColors.primaryGreen,
          filled: false,
          fillColor: MyColors.primaryGreen,
          hintText: widget.hintText,
          hintStyle: widget.hintTextStyle,
          // TextStyles.dynamicTextStyle(
          //     fontFamily: Fonts.mPLUSRounded1cRegular,
          //     color: MyColors.gray,
          //     fontSize: responsive.fp(16)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(23),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: widget.borderSide ??
                  BorderSide(color: MyColors.primaryGreen, width: 2),
              borderRadius: BorderRadius.circular(23)),
          contentPadding: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
          constraints: BoxConstraints(
            maxWidth: responsive.wp(78),
            maxHeight: responsive.hp(5.5),
          ),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.obscureText
              ? IconButton(
                  icon: Icon(
                    _obscureTextState ? Icons.visibility : Icons.visibility_off,
                    color: MyColors.primaryGreen,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureTextState = !_obscureTextState;
                    });
                  })
              : null),
    );
  }
}
