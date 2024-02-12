import 'package:flutter/material.dart';

class CCon extends StatelessWidget {
  EdgeInsets? padding;
  Color? color;
  Widget child;

  CCon({
    super.key,
    required this.child,
    this.padding,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: color,
      child: child
    );
  }
}

class CCol extends StatelessWidget {
  List<Widget> children;
  MainAxisAlignment main = MainAxisAlignment.start;
  CrossAxisAlignment cross = CrossAxisAlignment.start;

  CCol({
    super.key,
    required this.children,
    main, cross
  }) {
    this.main = main ?? MainAxisAlignment.start;
    this.cross = cross ?? CrossAxisAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: children,
        mainAxisAlignment: main, crossAxisAlignment: cross,
    );
  }
}

class CRow extends StatelessWidget {
  List<Widget> children;
  MainAxisAlignment main = MainAxisAlignment.start;
  CrossAxisAlignment cross = CrossAxisAlignment.start;

  CRow({
    super.key,
    required this.children,
    main, cross
  }) {
    this.main = main ?? MainAxisAlignment.start;
    this.cross = cross ?? CrossAxisAlignment.start;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
        children: children,
        mainAxisAlignment: main, crossAxisAlignment: cross,
    );
  }
}

