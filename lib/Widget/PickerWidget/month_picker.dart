import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthPicker extends StatefulWidget {
  static final _now = DateTime.now().millisecondsSinceEpoch;
  int current;
  Widget child;
  Function select;

  MonthPicker({
    super.key,
    int? current,
    Widget? child,
    required this.select,
  }) :
      current = current ?? _now,
      child = child ?? Text((current ?? _now).toString())
  {}

  @override
  State<MonthPicker> createState() => _MonthPickerState();
}

class _MonthPickerState extends State<MonthPicker> {
  @override
  Widget build(BuildContext context) {
    return (
      TextButton(
          child: widget.child,
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return MonthPickerModal(current: widget.current, select: widget.select);
              },
            );
          }
      )
    );
  }
}

class MonthPickerModal extends StatefulWidget {
  int current;
  Function select;

  MonthPickerModal({
    super.key,
    required this.current,
    required this.select
  });

  @override
  State<MonthPickerModal> createState() => _MonthPickerModalState();
}

class _MonthPickerModalState extends State<MonthPickerModal> {
  static final _now = DateTime.now().millisecondsSinceEpoch;
  List<int> years;
  List<int> months;

  _MonthPickerModalState():
        years = List<int>.generate(20, (index) => index).map((index) {
          int y = int.parse(DateFormat('yyyy').format(DateTime.fromMillisecondsSinceEpoch(_now)));
          return y - index;
        }).toList(),
        months = List<int>.generate(12, (index) => index).map((index) {
          return index + 1;
        }).toList()
  {}

  void _select(String mode, int n) {
    DateTime c = DateTime.fromMillisecondsSinceEpoch(widget.current);
    DateTime t;
    if (mode == 'year') {
      t = new DateTime(n, c.month, c.day, c.hour, c.minute, c.second, c.millisecond, c.microsecond);
    } else {
      t = new DateTime(c.year, n, c.day, c.hour, c.minute, c.second, c.millisecond, c.microsecond);
    }
    setState(() {
      widget.current = t.millisecondsSinceEpoch;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: (
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
              child: (
                  Expanded(child: (
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: ListView(
                                  scrollDirection: Axis.vertical,
                                  children: years.map((year) {
                                    bool isSelected = year.toString() == DateFormat('yyyy').format(DateTime.fromMillisecondsSinceEpoch(widget.current));
                                    if (isSelected) {
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                        child: Text(year.toString() + '년',
                                            style: TextStyle(fontSize: 16, color: Colors.white)
                                        ),
                                        onPressed: () => _select('year', year),
                                      );
                                    } else {
                                      return TextButton(
                                        child: Text(year.toString() + '년',
                                            style: TextStyle(fontSize: 16, color: Colors.black)
                                        ),
                                        onPressed: () => _select('year', year),
                                      );
                                    }
                                  }).toList(),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                  flex: 1,
                                  child: ListView(
                                    scrollDirection: Axis.vertical,
                                    children: months.map((month) {
                                      bool isSelected = month.toString() == DateFormat('M').format(DateTime.fromMillisecondsSinceEpoch(widget.current));
                                      if (isSelected) {
                                        return ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                          child: Text(month.toString() + '월',
                                              style: TextStyle(fontSize: 16, color: Colors.white)
                                          ),
                                          onPressed: () => _select('month', month),
                                        );
                                      } else {
                                        return TextButton(
                                          child: Text(month.toString() + '월',
                                              style: TextStyle(fontSize: 16, color: Colors.black)
                                          ),
                                          onPressed: () => _select('month', month),
                                        );
                                      }
                                    }).toList(),
                                  )
                              )
                            ],
                          )),
                          SizedBox(height: 16),
                          Container(
                            child: (
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFFD600), minimumSize: Size.fromHeight(50)),
                                    child: Text('확인', style: TextStyle(color: Colors.black, fontSize: 18),),
                                    onPressed: () {
                                      widget.select(widget.current);
                                      Navigator.pop(context);
                                    }
                                )
                            ),
                          ),
                        ],
                      )
                  ))
              ),)
        )
    );
  }
}

