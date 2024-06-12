import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:poorlex/libs/theme.dart';

class CommonDatePicker extends StatefulWidget {
  final void Function(int) onChangeDate;
  final DateTime? initDateTime;
  const CommonDatePicker({
    super.key,
    required this.onChangeDate,
    this.initDateTime,
  });

  @override
  State<CommonDatePicker> createState() => _CommonDatePickerState();

  static Future<void> show({
    required BuildContext context,
    required void Function(int) onChangeDate,
    DateTime? initDateTime,
  }) async {
    return await showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      builder: (context) {
        return CommonDatePicker(
          onChangeDate: onChangeDate,
        );
      },
    );
  }
}

class _CommonDatePickerState extends State<CommonDatePicker> {
  late DateTime _now = widget.initDateTime ?? DateTime.now();

  /// [MEMO] 현재 년도에서 -2 ~ +2년
  late final List<int> _years =
      List<int>.generate(5, (index) => index).map((index) {
    int y = _now.year - 2;
    return y + index;
  }).toList();

  final List<int> _months =
      List<int>.generate(12, (index) => index).map((index) {
    return index + 1;
  }).toList();

  final List<int> _days = List<int>.generate(31, (index) => index).map((index) {
    return index + 1;
  }).toList();

  late int _selectYear = _now.year;
  late int _selectMonth = _now.month;
  late int _selectDay = _now.day;

  ///  디바운싱으로 사용
  Timer? _timer;

  /// [MEMO] 타이머는 사용자가 스크롤을 비정상적으로 많이 했을 경우 유저 경험을 망치지 않기 위해
  /// 디바운싱으로 구현합니다.
  void _onChangeDate() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: 500), () {
      widget.onChangeDate(_generateDate());
    });
  }

  int _generateDate() {
    /// [MEMO] 2024.02.30일 처럼 존재하지 않는 시간일 경우를 판단합니다.
    final generateDate = DateTime(_selectYear, _selectMonth, _selectDay);

    if (_selectYear != generateDate.year) {
      _selectYear = generateDate.year;
      _yearScrollController.animateToItem(
        _years.indexOf(_selectYear),
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
    if (_selectMonth != generateDate.month) {
      _selectMonth = generateDate.month;
      _monthScrollController.animateToItem(
        _months.indexOf(_selectMonth),
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
    if (_selectDay != generateDate.day) {
      _selectDay = generateDate.day;
      _dayScrollController.animateToItem(
        _days.indexOf(_selectDay),
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
      );
    }
    setState(() {});

    return DateTime(_selectYear, _selectMonth, _selectDay)
        .millisecondsSinceEpoch;
  }

  late final FixedExtentScrollController _yearScrollController =
      FixedExtentScrollController(initialItem: _years.indexOf(_selectYear));
  late final FixedExtentScrollController _monthScrollController =
      FixedExtentScrollController(initialItem: _months.indexOf(_selectMonth));
  late final FixedExtentScrollController _dayScrollController =
      FixedExtentScrollController(initialItem: _days.indexOf(_selectDay));

  @override
  void dispose() {
    _yearScrollController.dispose();
    _monthScrollController.dispose();
    _dayScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 398,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: CColors.black.withOpacity(0.9)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 16, left: 32, right: 32),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildPicker(
                  onSelectedItemChanged: (p0) {
                    _selectYear = _years[p0];
                    setState(() {});
                    _onChangeDate();
                  },
                  scrollController: _yearScrollController,
                  initialItemIndex: _years.indexOf(_selectYear),
                  children: _years
                      .map(
                        (e) => Text(
                          "$e",
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
                _buildPicker(
                  onSelectedItemChanged: (p0) {
                    _selectMonth = _months[p0];
                    setState(() {});
                    _onChangeDate();
                  },
                  scrollController: _monthScrollController,
                  initialItemIndex: _months.indexOf(_selectMonth),
                  children: _months
                      .map(
                        (e) => Text(
                          "${NumberFormat('00').format(e)}",
                          style: TextStyle(
                            fontFamily: 'NeoDunggeunmoPro-Regular',
                            fontSize: 30,
                            letterSpacing: -0.6,
                            color: _selectMonth == e
                                ? CColors.yellow
                                : CColors.gray41,
                            height: 50 / 30,
                          ),
                        ),
                      )
                      .toList(),
                ),
                _buildPicker(
                  initialItemIndex: _days.indexOf(_selectDay),
                  scrollController: _dayScrollController,
                  onSelectedItemChanged: (p0) {
                    _selectDay = _days[p0];
                    setState(() {});
                    _onChangeDate();
                  },
                  children: _days
                      .map(
                        (e) => Text(
                          "${NumberFormat('00').format(e)}",
                          style: TextStyle(
                            fontFamily: 'NeoDunggeunmoPro-Regular',
                            fontSize: 30,
                            letterSpacing: -0.6,
                            color: _selectDay == e
                                ? CColors.yellow
                                : CColors.gray41,
                            height: 50 / 30,
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
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

  Widget _buildPicker({
    required void Function(int) onSelectedItemChanged,
    required List<Widget> children,
    required int initialItemIndex,
    required FixedExtentScrollController scrollController,
  }) {
    return Expanded(
      child: Container(
        height: 272,
        child: CupertinoPicker(
          scrollController: scrollController,
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
          onSelectedItemChanged: onSelectedItemChanged,
          children: children,
        ),
      ),
    );
  }
}
