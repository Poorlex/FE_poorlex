import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poorlex/libs/theme.dart';

class Picker extends StatefulWidget {
  static final _now = DateTime.now().millisecondsSinceEpoch;
  final String type;
  final int current;
  final Widget child;
  final void Function(int d) select;

  Picker({
    super.key,
    int? current,
    Widget? child,
    required this.type,
    required this.select,
  })  : current = current ?? _now,
        child = child ?? Text((current ?? _now).toString());

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
      ),
      child: widget.child,
      onPressed: () async {
        await showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) => PickerModal(
            type: widget.type,
            current: widget.current,
            select: widget.select,
          ),
        );
      },
    );
  }
}

/// [REFACTOR] Rogan: 동작 안하는 코드
/// 하위에서 상위 value를 업데이트 할 수 없습니다.
class PickerModal extends StatefulWidget {
  final int current;
  final String type;
  final void Function(int d) select;

  PickerModal({
    super.key,
    required this.current,
    required this.type,
    required this.select,
  });

  @override
  State<PickerModal> createState() => _PickerModalState();
}

class _PickerModalState extends State<PickerModal> {
  int _now = DateTime.now().millisecondsSinceEpoch;

  /// [MEMO] "generate(1,"을 늘리면, 그 수만큼 리스트가 생김.
  late final List<int> _years =
      List<int>.generate(1, (index) => index).map((index) {
    int y = int.parse(
        DateFormat('yyyy').format(DateTime.fromMillisecondsSinceEpoch(_now)));
    return y - index;
  }).toList();
  final List<int> _months =
      List<int>.generate(12, (index) => index).map((index) {
    return index + 1;
  }).toList();
  final List<int> _days = List<int>.generate(31, (index) => index).map((index) {
    return index + 1;
  }).toList();

  _PickerModalState();

  void _select(String mode, int n) {
    DateTime c = DateTime.fromMillisecondsSinceEpoch(widget.current);
    DateTime t;
    if (mode == 'year') {
      t = new DateTime(n, c.month, c.day, c.hour, c.minute, c.second,
          c.millisecond, c.microsecond);
    } else if (mode == 'month') {
      t = new DateTime(c.year, n, c.day, c.hour, c.minute, c.second,
          c.millisecond, c.microsecond);
    } else {
      t = new DateTime(c.year, c.month, n, c.hour, c.minute, c.second,
          c.millisecond, c.microsecond);
    }
    widget.select(t.millisecondsSinceEpoch);
    setState(() {
      _now = t.millisecondsSinceEpoch;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: _years.map((year) {
              bool isSelected = year.toString() ==
                  DateFormat('yyyy')
                      .format(DateTime.fromMillisecondsSinceEpoch(_now));
              if (isSelected) {
                return ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: CColors.black),
                  child:
                      Text(year.toString() + '년', style: CTextStyles.Body2()),
                  onPressed: () => _select('year', year),
                );
              } else {
                return TextButton(
                  child: Text(year.toString() + '년',
                      style: CTextStyles.Body2(color: CColors.black)),
                  onPressed: () => _select('year', year),
                );
              }
            }).toList(),
          ))
    ];

    if (widget.type == 'MONTH' || widget.type == 'DAY') {
      children.add(SizedBox(width: 8));
      children.add(Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: _months.map((month) {
              bool isSelected = month.toString() ==
                  DateFormat('M')
                      .format(DateTime.fromMillisecondsSinceEpoch(_now));
              if (isSelected) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.black),
                    child: Text(month.toString() + '월',
                        style: CTextStyles.Body2()),
                    onPressed: () => _select('month', month));
              } else {
                return TextButton(
                  child: Text(month.toString() + '월',
                      style: CTextStyles.Body2(color: CColors.black)),
                  onPressed: () => _select('month', month),
                );
              }
            }).toList(),
          )));
    }

    if (widget.type == 'DAY') {
      children.add(SizedBox(width: 8));
      children.add(Expanded(
          flex: 1,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: _days.map((day) {
              bool isSelected = day.toString() ==
                  DateFormat('d')
                      .format(DateTime.fromMillisecondsSinceEpoch(_now));
              if (isSelected) {
                return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.black),
                    child:
                        Text(day.toString() + '일', style: CTextStyles.Body2()),
                    onPressed: () => _select('day', day));
              } else {
                return TextButton(
                  child: Text(day.toString() + '일',
                      style: CTextStyles.Body2(color: CColors.black)),
                  onPressed: () => _select('day', day),
                );
              }
            }).toList(),
          )));
    }

    return SizedBox(
        height: 300,
        child: (Container(
            color: CColors.white,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
            child: (Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(child: Row(children: children)),
                  SizedBox(height: 16),
                  Container(
                      child: (ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: CColors.yellow,
                              minimumSize: Size.fromHeight(50)),
                          child: Text('확인',
                              style:
                                  CTextStyles.Headline(color: CColors.black)),
                          onPressed: () {
                            widget.select(widget.current);
                            Navigator.pop(context);
                          }))),
                ])))));
  }
}

class DayPickerModal extends StatefulWidget {
  final int current;
  final void Function() select;

  DayPickerModal({
    super.key,
    required this.current,
    required this.select,
  });

  @override
  State<DayPickerModal> createState() => _DayPickerModalState();
}

class _DayPickerModalState extends State<DayPickerModal> {
  static final _now = DateTime.now().millisecondsSinceEpoch;
  List<int> years;
  List<int> months;
  List<int> days;

  _DayPickerModalState()
      : years = List<int>.generate(20, (index) => index).map((index) {
          int y = int.parse(DateFormat('yyyy')
              .format(DateTime.fromMillisecondsSinceEpoch(_now)));
          return y - index;
        }).toList(),
        months = List<int>.generate(12, (index) => index).map((index) {
          return index + 1;
        }).toList(),
        days = List<int>.generate(31, (index) => index).map((index) {
          return index + 1;
        }).toList() {}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Container(
            color: CColors.white,
            padding: EdgeInsets.fromLTRB(20, 20, 20, 40)));
  }
}
