import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Libs/Theme.dart';

import 'package:poorlex/Widget/Common/icon.dart';
import 'package:poorlex/Widget/Common/Buttons.dart';

import 'package:poorlex/Widget/Common/Modal.dart';

class AnnounceMent extends StatefulWidget {
  const AnnounceMent({
    super.key,
  });

  @override
  State<AnnounceMent> createState() => _AnnounceMentState();
}

class _AnnounceMentState extends State<AnnounceMent> {
  final List<String> appVersion = ['앱 버전', 'U.0.0.0'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Button(
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('공지사항', style: CTextStyles.Headline()),
                      CustomIcon(
                        icon: 'arrow-game-right',
                        width: 16,
                        height: 16,
                        color: CColors.whiteStr,
                      ),
                    ])),
            onPressed: () => Get.toNamed('/my/notice')),
        /*
        Button(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('고객센터', style: CTextStyles.Headline()),
                  CustomIcon(
                      icon: 'arrow-game-right',
                      width: 16,
                      height: 16,
                      color: CColors.whiteStr),
                ],
              ),
            ),
            onPressed: () => Get.toNamed('/my/customer')),
         */
        Button(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('이용약관', style: CTextStyles.Headline()),
                CustomIcon(
                    icon: 'arrow-game-right',
                    width: 16,
                    height: 16,
                    color: CColors.whiteStr),
              ],
            ),
          ),
          onPressed: () => Get.toNamed('/my/terms'),
        ),
        Button(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('개인정보 처리방침', style: CTextStyles.Headline()),
                CustomIcon(
                    icon: 'arrow-game-right',
                    width: 16,
                    height: 16,
                    color: CColors.whiteStr),
              ],
            ),
          ),
          onPressed: () => Get.toNamed('/my/privacy'),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('앱 버전', style: CTextStyles.Headline()),
              Text('U.0.0.0', style: CTextStyles.Headline()),
            ],
          ),
        ),
        Button(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('로그아웃',
                    style: CTextStyles.Headline(color: CColors.gray30)),
                CustomIcon(
                    icon: 'arrow-game-right',
                    width: 16,
                    height: 16,
                    color: CColors.whiteStr),
              ],
            ),
          ),
          onPressed: () => CustomAlert(body: '로그아웃하시겠습니까').builder(context)
        ),
        Button(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('회원탈퇴',
                    style: CTextStyles.Headline(color: CColors.gray30)),
                CustomIcon(
                    icon: 'arrow-game-right',
                    width: 16,
                    height: 16,
                    color: CColors.whiteStr),
              ],
            ),
          ),
            onPressed: () => CustomAlert(body: '정말 탈퇴하시겠습니까').builder(context)
        ),
      ],
    );
  }
}
