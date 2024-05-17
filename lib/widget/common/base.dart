import 'package:flutter/material.dart';

class CCon extends StatelessWidget {
  final EdgeInsets? padding;
  final Color? color;
  final Widget child;

  CCon({super.key, required this.child, this.padding, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(padding: padding, color: color, child: child);
  }
}

class CCol extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment main;
  final CrossAxisAlignment cross;

  CCol({
    super.key,
    required this.children,
    this.main = MainAxisAlignment.start,
    this.cross = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: children,
      mainAxisAlignment: main,
      crossAxisAlignment: cross,
    );
  }
}

class CRow extends StatelessWidget {
  final List<Widget> children;
  final MainAxisAlignment main;
  final CrossAxisAlignment cross;

  CRow({
    super.key,
    required this.children,
    this.main = MainAxisAlignment.start,
    this.cross = CrossAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: children,
      mainAxisAlignment: main,
      crossAxisAlignment: cross,
    );
  }
}
