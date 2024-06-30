import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poorlex/libs/theme.dart';

class LimitedDatePicker extends StatefulWidget {
  final void Function(int) onChangeDate;
  const LimitedDatePicker({
    super.key,
    required this.onChangeDate,
  });

  @override
  State<LimitedDatePicker> createState() => _LimitedDatePickerState();

  static Future<void> show({
    required BuildContext context,
    required void Function(int) onChangeDate,
    DateTime? initDateTime,
  }) async {
    return await showModalBottomSheet(
      barrierColor: CColors.gray10.withOpacity(0.6),
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return LimitedDatePicker(
          onChangeDate: onChangeDate,
        );
      },
    );
  }
}

class _LimitedDatePickerState extends State<LimitedDatePicker> {
  final DateTime _now = DateTime.now();
  late DateTime _selectYear = _now;

  late final _weekDates = _getWeekDates();

  late final FixedExtentScrollController _scrollController =
      FixedExtentScrollController(
    initialItem: _weekDates.indexOf(_selectYear),
  );

  void _onSelectedItemChanged(int index) {
    _selectYear = _weekDates[index];
    setState(() {});
    _onChangeDate();
  }

  ///  디바운싱으로 사용
  Timer? _timer;

  /// [MEMO] 타이머는 사용자가 스크롤을 비정상적으로 많이 했을 경우 유저 경험을 망치지 않기 위해
  /// 디바운싱으로 구현합니다.
  void _onChangeDate() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: 500), () {
      _generateDate();
      widget.onChangeDate(_selectYear.millisecondsSinceEpoch);
    });
  }

  void _generateDate() {
    if (_selectYear.isAfter(_now)) {
      _selectYear = _now;
      _scrollController.animateToItem(
        _weekDates.indexOf(_selectYear),
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 398,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: CColors.black),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Container(
              height: 272,
              child: CupertinoPicker(
                scrollController: _scrollController,
                selectionOverlay: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: CColors.yellow,
                      ),
                      bottom: BorderSide(
                        color: CColors.yellow,
                      ),
                    ),
                  ),
                ),
                itemExtent: 56,
                onSelectedItemChanged: _onSelectedItemChanged,
                children: _weekDates
                    .map(
                      (e) => Text(
                        "${DateFormat('yyyy-MM-dd').format(e)}",
                        style: TextStyle(
                          fontFamily: 'NeoDunggeunmoPro-Regular',
                          fontSize: 30,
                          letterSpacing: -0.6,
                          color: _selectYear == e
                              ? CColors.yellow
                              : CColors.gray41,
                          height: 50 / 30,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: 52,
              decoration: BoxDecoration(
                color: CColors.yellow,
              ),
              child: Text(
                "확인",
                style: CTextStyles.Title3(color: CColors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  List<DateTime> _getWeekDates() {
    int currentWeekday = _now.weekday;

    // 월요일로 이동
    final DateTime startOfWeek =
        _now.subtract(Duration(days: currentWeekday - 1));

    List<DateTime> weekDates = [];

    for (int i = 0; i < 7; i++) {
      DateTime date = startOfWeek.add(Duration(days: i));
      weekDates.add(date);
    }

    return weekDates;
  }
}
