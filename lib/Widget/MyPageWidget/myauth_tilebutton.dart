import 'package:flutter/material.dart';

class ExpandableOutlineButton extends StatefulWidget {
  final List<Widget> title;
  final List<Widget> children;
  const ExpandableOutlineButton(
      {super.key, required this.title, required this.children});

  @override
  _ExpandableOutlineButtonState createState() =>
      _ExpandableOutlineButtonState();
}

class _ExpandableOutlineButtonState extends State<ExpandableOutlineButton> {
  bool _isExpanded = false;
  late List<String> samples;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...widget.title, // Image 위젯들을 확장 가능한 버튼의 제목으로 출력
              Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
            ],
          ),
        ),
        if (_isExpanded) ...widget.children,
      ],
    );
  }
}
