import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:poorlex/Controller/Layout.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Models/Common.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
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
  final layout = Get.find<LayoutController>();
  String version = '';

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = '${packageInfo.version}(${packageInfo.buildNumber})';
    });
  }

  @override
  void initState() {
    super.initState();
    getVersion();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CButton(
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('공지사항', style: CTextStyles.Headline()),
                      CIcon(
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
        CButton(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('이용약관', style: CTextStyles.Headline()),
                CIcon(
                    icon: 'arrow-game-right',
                    width: 16,
                    height: 16,
                    color: CColors.whiteStr),
              ],
            ),
          ),
          onPressed: () => Get.toNamed('/my/terms'),
        ),
        CButton(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('개인정보 처리방침', style: CTextStyles.Headline()),
                CIcon(
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
              Text(version, style: CTextStyles.Headline()),
            ],
          ),
        ),
        CButton(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('로그아웃',
                      style: CTextStyles.Headline(color: CColors.gray30)),
                  CIcon(
                      icon: 'arrow-game-right',
                      width: 16,
                      height: 16,
                      color: CColors.whiteStr),
                ],
              ),
            ),
            onPressed: () => layout.setAlert(Alert(
                isOpen: true,
                type: AlertType.confirm,
                submitText: '네', cancelText: '아니요',
                body: Text('로그아웃 하시겠습니까?',
                    style: CTextStyles.Headline(color: CColors.gray50))))),
        CButton(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('회원탈퇴',
                      style: CTextStyles.Headline(color: CColors.gray30)),
                  CIcon(
                      icon: 'arrow-game-right',
                      width: 16,
                      height: 16,
                      color: CColors.whiteStr),
                ],
              ),
            ),
            onPressed: () => layout.setAlert(Alert(
                isOpen: true,
                type: AlertType.confirm,
                submitText: '네, 떠날게요', cancelText: '아니요',
                body: Text('회원 탈퇴 시 등록된 모든 지출내역이 삭제되고, 삭제된 데이터는 복구할 수 없다네.\n\n정말 떠날텐가...?',
                    style: CTextStyles.Headline(color: CColors.gray50), softWrap: true, )))),
      ],
    );
  }
}
