import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:poorlex/widget/common/picker.dart';

import 'package:poorlex/libs/theme.dart';

class CalenderHeader extends StatefulWidget {
  final int current;
  final void Function(int d) select;

  CalenderHeader({
    super.key,
    required this.current,
    required this.select,
  });

  @override
  State<CalenderHeader> createState() => _CalenderHeaderState();
}

class _CalenderHeaderState extends State<CalenderHeader> {
  void _changeMonth(String mode) {
    DateTime c = DateTime.fromMillisecondsSinceEpoch(widget.current);
    DateTime t = new DateTime(
        c.year,
        mode == 'prev' ? c.month - 1 : c.month + 1,
        c.day,
        c.hour,
        c.minute,
        c.second,
        c.millisecond,
        c.microsecond);
    widget.select(t.millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: (Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('요약', style: CTextStyles.Title1()),
          SizedBox(height: 20),
          Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                IconButton(
                    icon: Icon(Icons.arrow_back_ios,
                        size: 25, color: CColors.white),
                    onPressed: () => _changeMonth('prev')),
                Picker(
                  type: 'MONTH',
                  current: widget.current,
                  select: widget.select,
                  child: Row(children: [
                    Text(
                        DateFormat('yyyy년 MM월').format(
                            DateTime.fromMillisecondsSinceEpoch(
                                widget.current)),
                        style: CTextStyles.Title1()),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_drop_down_sharp,
                        size: 35, color: CColors.white)
                  ]),
                ),
                IconButton(
                    icon: Icon(Icons.arrow_forward_ios,
                        size: 25, color: CColors.white),
                    onPressed: () => _changeMonth('next'))
              ])),
        ])));
  }
}
