import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';
import 'package:poorlex/Widget/Common/Icon.dart';

class CTextField extends StatefulWidget {
  late final TextEditingController? controller;
  late final String placeholder;
  late final bool isUnderline;
  late final TextStyle textStyle;
  late final TextStyle hintStyle;
  late final TextStyle labelStyle;
  late final String? label;
  late final Color color;
  late final Color primaryColor;
  late final Color backgroundColor;
  late final TextInputType keyType;
  late final int? maxLines;
  late final int? maxLength;
  late final EdgeInsets? padding;
  late final bool isClose;

  CTextField(
      {super.key,
        this.isUnderline = true,
        this.maxLines = 1,
        this.maxLength,
        textStyle,
        hintStyle,
        labelStyle,
        this.label,
        this.placeholder = '',
        color,
        primaryColor,
        this.backgroundColor = Colors.transparent,
        this.keyType = TextInputType.text,
        this.isClose = false,
        padding,
        this.controller}) {
    this.textStyle = textStyle ?? CTextStyles.Title3();
    this.hintStyle = hintStyle ?? CTextStyles.Title3(color: CColors.gray40);
    this.labelStyle = labelStyle ?? CTextStyles.Body3(color: CColors.gray40);
    this.color = color ?? CColors.gray40;
    this.primaryColor = primaryColor ?? CColors.purple;
    this.padding = padding ?? EdgeInsets.symmetric(horizontal: 0);
  }

  @override
  State<CTextField> createState() => _CTextFieldState();
}

class _CTextFieldState extends State<CTextField> {
  int size = 0;

  onChange () {
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
    children.add(TextField(
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
            suffixIcon: widget.isClose && size > 0 ? CButton(
              onPressed: widget.controller?.clear,
              child: CustomIcon(icon: 'close-circle', width: 25, height: 25),
            ) : null,
            suffixIconConstraints: BoxConstraints(maxHeight: 20),
            contentPadding: widget.padding,
            border: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.isUnderline ? widget.color : Colors.transparent)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.isUnderline ? widget.color : Colors.transparent)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: widget.isUnderline ? widget.primaryColor : Colors.transparent)))));

    return Stack(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
      (widget.maxLength != null ? Positioned(bottom: 10, right: 10, child: Text("${size}/${widget.maxLength}", style: CTextStyles.Caption1(color: CColors.gray30),)) : SizedBox.shrink())
    ]);
  }
}
