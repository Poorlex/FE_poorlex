import 'package:flutter/material.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/icon.dart';

class CTextField extends StatefulWidget {
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
  })  : this.textStyle = textStyle ?? CTextStyles.Title3(),
        this.hintStyle = hintStyle ?? CTextStyles.Title3(color: CColors.gray40),
        this.labelStyle =
            labelStyle ?? CTextStyles.Body3(color: CColors.gray40),
        this.color = color ?? CColors.gray40,
        this.primaryColor = primaryColor ?? CColors.purple,
        this.padding = padding ?? EdgeInsets.symmetric(horizontal: 0);

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  int size = 0;

  onChange() {
    setState(() {
      size = widget.controller!.text.length;
    });
  }

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(onChange);
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    if (widget.label != null) {
      children.add(Text(widget.label!, style: widget.labelStyle));
      children.add(SizedBox(height: 8));
    }
    children.add(
      TextField(
        controller: widget.controller,
        cursorColor: widget.primaryColor,
        keyboardType: widget.keyType,
        style: widget.textStyle,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        decoration: InputDecoration(
          hintText: widget.placeholder,
          hintStyle: widget.hintStyle,
          fillColor: widget.backgroundColor,
          filled: true,
          counterText: '',
          suffixIcon: widget.suffix != null
              ? widget.suffix
              : widget.isClose && size > 0
                  ? CButton(
                      onPressed: widget.controller?.clear,
                      child: CIcon(icon: 'close-circle', width: 25, height: 25),
                    )
                  : null,
          suffixIconConstraints: BoxConstraints(maxHeight: widget.suffixHeight),
          contentPadding: widget.padding,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              width: widget.underlineWidth,
              color: widget.isUnderline ? widget.color : Colors.transparent,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: widget.underlineWidth,
              color: widget.isUnderline ? widget.color : Colors.transparent,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: widget.underlineWidth,
              color:
                  widget.isUnderline ? widget.primaryColor : Colors.transparent,
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
        widget.maxLength != null
            ? Positioned(
                bottom: 10,
                right: 10,
                child: Text(
                  "${size}/${widget.maxLength}",
                  style: CTextStyles.Caption1(color: CColors.gray30),
                ))
            : SizedBox.shrink()
      ],
    );
  }
}
