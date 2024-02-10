import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:poorlex/Widget/Common/picker.dart';

class CalenderHeader extends StatefulWidget {
  final int current;
  final Function select;

  CalenderHeader({
    super.key,
    required int this.current,
    required Function this.select
  });

  @override
  State<CalenderHeader> createState() => _CalenderHeaderState();
}

class _CalenderHeaderState extends State<CalenderHeader> {
  void _changeMonth(String mode) {
    DateTime c = DateTime.fromMillisecondsSinceEpoch(widget.current);
    DateTime t = new DateTime(c.year, mode == 'prev' ? c.month - 1 : c.month + 1, c.day, c.hour, c.minute, c.second, c.millisecond, c.microsecond);
    widget.select(t.millisecondsSinceEpoch);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: (
            // Expanded(child:
              Column(
                  children: [
                    Text('요약', style: TextStyle(fontSize: 24, color: Colors.white)),
                    SizedBox(height: 20),
                    Container(
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back_ios, size: 25, color: Colors.white,),
                                onPressed: () => _changeMonth('prev')
                            ),
                            Picker(
                                type: 'MONTH',
                                current: widget.current,
                                child: Row(
                                  children: [
                                    Text(DateFormat('yyyy년 MM월').format(DateTime.fromMillisecondsSinceEpoch(widget.current)),
                                        style: TextStyle(color: Colors.white, fontSize: 25)),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_drop_down_sharp, size: 35, color: Colors.white,)
                                  ],
                                ),
                                select: widget.select
                            ),
                            IconButton(
                                icon: Icon(Icons.arrow_forward_ios, size: 25, color: Colors.white,),
                                onPressed: () => _changeMonth('next')
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        )
                    ),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                )
            )
        // )
    );
  }
}
