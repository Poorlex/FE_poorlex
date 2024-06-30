import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/icon.dart';

class CTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String placeholder;
  final bool isUnderline;
  final TextStyle textStyle;
  final TextStyle hintStyle;
  final TextStyle labelStyle;
  final String? label;
  final Color color;
  final Color primaryColor;
  final Color backgroundColor;
  final TextInputType keyType;
  final int? maxLines;
  final int? maxLength;
  final double underlineWidth;
  final EdgeInsets? padding;
  final bool isClose;
  final Widget? suffix;
  final double suffixHeight;
  final void Function()? onTap;

  CTextField({
    super.key,
    this.isUnderline = true,
    this.maxLines = 1,
    this.maxLength,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    TextStyle? labelStyle,
    this.label,
    this.placeholder = '',
    Color? color,
    Color? primaryColor,
    this.backgroundColor = Colors.transparent,
    this.keyType = TextInputType.text,
    this.isClose = false,
    this.underlineWidth = 1.0,
    EdgeInsets? padding,
    this.suffix,
    this.suffixHeight = 20,
    this.controller,
    this.onTap,
  })  : this.textStyle = textStyle ?? CTextStyles.Title3(),
        this.hintStyle = hintStyle ?? CTextStyles.Title3(color: CColors.gray40),
        this.labelStyle =
            labelStyle ?? CTextStyles.Body3(color: CColors.gray40),
        this.color = color ?? CColors.gray40,
        this.primaryColor = primaryColor ?? CColors.purple,
        this.padding = padding ?? EdgeInsets.symmetric(horizontal: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (label != null) {
      children.add(Text(label!, style: labelStyle));
      children.add(SizedBox(height: 8));
    }
    children.add(
      TextField(
        onTap: onTap,
        controller: controller,
        cursorColor: primaryColor,
        keyboardType: keyType,
        style: textStyle,
        maxLines: maxLines,
        maxLength: maxLength,
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: hintStyle,
          fillColor: backgroundColor,
          filled: true,
          counterText: '',
          suffixIcon: suffix != null
              ? suffix
              : isClose && (controller?.text.length ?? 0) > 0
                  ? CButton(
                      onPressed: controller?.clear,
                      child: CIcon(icon: 'close-circle', width: 25, height: 25),
                    )
                  : null,
          suffixIconConstraints: BoxConstraints(maxHeight: suffixHeight),
          contentPadding: padding,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: underlineWidth,
              color: isUnderline ? color : Colors.transparent,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: underlineWidth,
              color: isUnderline ? color : Colors.transparent,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: underlineWidth,
              color: isUnderline ? primaryColor : Colors.transparent,
            ),
          ),
        ),
      ),
    );

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
        if (maxLength != null)
          Positioned(
            bottom: 10,
            right: 10,
            child: Text(
              "${controller?.text.length}/$maxLength",
              style: CTextStyles.Caption1(color: CColors.gray30),
            ),
          )
      ],
    );
  }
}
