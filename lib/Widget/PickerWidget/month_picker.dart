import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

class MonthPicker extends StatefulWidget {
  static final _now = DateTime.now().millisecondsSinceEpoch;
  int current = _now;
  bool isOpen = false;
  Widget child;
  List<int> years;
  List<int> months;

  MonthPicker({
    super.key,
    this.isOpen = false,
    int? current,
    Widget? child,
  }) :
      current = current ?? _now,
      child = child ?? Text((current ?? _now).toString()),
      years = List<int>.generate(20, (index) => index).map((index) {
        int y = int.parse(DateFormat('yyyy').format(DateTime.fromMillisecondsSinceEpoch(_now)));
        return y - index;
      }).toList(),
      months = List<int>.generate(12, (index) => index).map((index) {
        return index + 1;
      }).toList()
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
                                        children: widget.years.map((year) {
                                          bool isSelected = year.toString() == DateFormat('yyyy').format(DateTime.fromMillisecondsSinceEpoch(widget.current));
                                          if (isSelected) {
                                            return ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                              child: Center(child: (
                                                  Text(year.toString() + '년',
                                                      style: TextStyle(fontSize: 16, color: Colors.white)
                                                  )
                                              )),
                                              onPressed: () => print(111),
                                            );
                                          } else {
                                            return TextButton(
                                              child: Center(child: (
                                                  Text(year.toString() + '년',
                                                      style: TextStyle(fontSize: 16, color: Colors.black)
                                                  )
                                              )),
                                              onPressed: () => print(111),
                                            );
                                          }
                                        }).toList(),
                                      ),
                                    ),
                                    /*
                                            Container(
                                            color: isSelected ? Colors.black : Colors.white,
                                            padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
                                            child: Center(child: (
                                              Text(year.toString() + '년',
                                                  style: TextStyle(fontSize: 16, color: isSelected ? Colors.white : Colors.black)
                                              )
                                            )),
                                             */
                                    SizedBox(width: 8),
                                    Expanded(
                                      flex: 1,
                                      child: ListView(
                                        scrollDirection: Axis.vertical,
                                        children: widget.months.map((month) {
                                          bool isSelected = month.toString() == DateFormat('M').format(DateTime.fromMillisecondsSinceEpoch(widget.current));
                                          if (isSelected) {
                                            return ElevatedButton(
                                              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                                              child: Center(child: (
                                                  Text(month.toString() + '월',
                                                      style: TextStyle(fontSize: 16, color: Colors.white)
                                                  )
                                              )),
                                              onPressed: () => print(111),
                                            );
                                          } else {
                                            return TextButton(
                                              child: Center(child: (
                                                  Text(month.toString() + '년',
                                                      style: TextStyle(fontSize: 16, color: Colors.black)
                                                  )
                                              )),
                                              onPressed: () => print(111),
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
                                          onPressed: () => print(111)
                                      )
                                  ),
                                ),
                              ],
                            )
                        ))
                    ),)
                  )
                );
              },
            );
          }
      )
    );
  }
}
