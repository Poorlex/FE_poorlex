import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/common/app_bar.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';
import 'package:poorlex/widget/level/character.dart';
import 'package:poorlex/widget/common/radio.dart';
import 'package:poorlex/widget/layout.dart';
import 'package:poorlex/widget/level/medal.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({super.key});

  @override
  State<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  late final int? _battleId = Get.arguments?['battleId'];

  /// [MEMO] mock 데이터입니다.
  List<bool> _checkList = List.generate(5, (index) => false);

  /// [MEMO] mock 데이터입니다.
  bool _showEmpty = false;

  void _onChanged(int index) {
    print("click!!");
    _checkList[index] = !_checkList[index];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _showEmpty
          ? Center(
              child: CImageAsset(
                name: 'assets/friends/empty.png',
                width: 343,
                height: 296,
              ),
            )
          : Layout(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 9,
                        horizontal: 24,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "내 거지 친구",
                            style: CTextStyles.Headline(),
                          ),
                          SizedBox(width: 10),
                          Text(
                            "4",
                            style: CTextStyles.Headline(
                              color: CColors.purpleLighter,
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (int index = 0; _checkList.length > index; index++)
                      _oneTile(
                        isChecked: _checkList[index],
                        onChanged: () => _onChanged(index),
                        level: index + 1,
                        nickname: '김절약',
                        description: "초보거지 김절약 입니다 :)",
                      ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: _bottomNavigationBar(context: context),
    );
  }

  CAppBar _appBar() {
    return CAppBar(
      children: [
        Text(
          "친구 목록",
          style: CTextStyles.Body1(),
        ),
        IconButton(
          iconSize: 26,
          style: IconButton.styleFrom(
              padding: EdgeInsets.zero, minimumSize: Size.zero),
          icon: SizedBox(width: 1),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _oneTile({
    required bool isChecked,
    required void Function() onChanged,
    required int level,
    required String nickname,
    required String description,
  }) {
    return GestureDetector(
      onTap: onChanged,
      child: Container(
        /// [MEMO] GestureDetector의 onTap을 title width 최대값으로 감지하려면
        /// 아래와같이 width최대값을 세팅하고 color를 세팅하여 터치영역을 확실히 합니다.
        width: double.maxFinite,
        color: CColors.black,
        padding: EdgeInsets.only(
          top: 11,
          bottom: 11,
          left: 16,
          right: 19,
        ),
        child: Row(
          children: [
            CRadio(
              isChecked: isChecked,
              onChanged: onChanged,
            ),
            SizedBox(width: 10),
            CCharacter(
              level: level,
              height: 40,
              width: 33,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CLevelMedal(
                      level: level,
                      width: 16,
                      height: 16,
                    ),
                    SizedBox(width: 6),
                    Text(
                      nickname,
                      style: CTextStyles.Caption2(),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                Text(
                  description,
                  style: CTextStyles.Caption2(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _bottomNavigationBar({
    required BuildContext context,
  }) {
    final bottomPaddingForIos = Platform.isIOS ? 8 : 0;
    final bottomOffset = MediaQuery.of(context).viewInsets.bottom +
        MediaQuery.of(context).padding.bottom +
        bottomPaddingForIos;

    final _hasChecked = _checkList.where((e) => e == true).isNotEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CButton(
          color: CColors.yellow,
          padding: EdgeInsets.symmetric(vertical: 13.5),
          type: ButtonTypes.elevated,
          onPressed: () {
            setState(() {
              _showEmpty = !_showEmpty;
            });
          },
          child: SizedBox(
            height: 25,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_hasChecked) ...[
                  Text(
                    '${_checkList.where((e) => e == true).length}',
                    style: CTextStyles.Title3(
                      color: CColors.purple,
                    ),
                  ),
                  Text(
                    '/${_checkList.length}',
                    style: CTextStyles.Title3(
                      color: CColors.white,
                    ),
                  ),
                  SizedBox(width: 6)
                ],
                Text(
                  "확인",
                  style: CTextStyles.Title3(
                    color: CColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: bottomOffset)
      ],
    );
  }
}
