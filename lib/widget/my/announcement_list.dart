import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:poorlex/controller/audio_controller.dart';
import 'package:poorlex/controller/kakao_auth.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/controller/user.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/provider/member_provider.dart';
import 'package:poorlex/widget/bottom_sheet/bottom_sheet_with_beggar.dart';
import 'package:poorlex/widget/common/dialog/confirm_dialog.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class AnnounceMent extends StatefulWidget {
  const AnnounceMent({
    super.key,
  });

  @override
  State<AnnounceMent> createState() => _AnnounceMentState();
}

class _AnnounceMentState extends State<AnnounceMent> {
  final layout = Get.find<LayoutController>();
  final user = Get.find<UserController>();
  String version = '';

  getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = '${packageInfo.version}(${packageInfo.buildNumber})';
    });
  }

  Future<void> _logout() async {
    AudioController().play(audioType: AudioType.complete);
    final result = await confirmDialog(
      context: context,
      bodyText: "로그아웃 하시겠습니까?",
      cancelText: "아니오",
      confirmText: "네",
    );
    if (result == true) {
      AudioController().play(audioType: AudioType.fail);
      await user.updateToken(null);
      await KaKaoAuthController().logOut();
      Get.offAllNamed('/login');
    }
  }

  Future<void> _withdrawal() async {
    final result = await BottomSheetWithBeggar.show(
      context: context,
      beggarAction: BeggarAction.withdrawal,
    );
    if (result == true) {
      await Get.find<MemberProvider>().memberWithdrawal();
      await user.updateToken(null);
      await KaKaoAuthController().logOut();
      Get.offAllNamed('/login');
    }
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: "poorlex.official@gmail.com",
      queryParameters: {
        "subject": "문의하기",
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
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
              ],
            ),
          ),
          onPressed: () => Get.toNamed('/my/notice'),
        ),
        CButton(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('고객센터', style: CTextStyles.Headline()),
                CIcon(
                  icon: 'arrow-game-right',
                  width: 16,
                  height: 16,
                  color: CColors.whiteStr,
                ),
              ],
            ),
          ),
          onPressed: _sendEmail,
        ),
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
                  color: CColors.whiteStr,
                ),
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
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (context) => Theme(
                  data: ThemeData.dark(),
                  child: LicensePage(applicationVersion: version),
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('라이센스', style: CTextStyles.Headline()),
                CIcon(
                  icon: 'arrow-game-right',
                  width: 16,
                  height: 16,
                  color: CColors.whiteStr,
                ),
              ],
            ),
          ),
        ),
        CButton(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '로그아웃',
                  style: CTextStyles.Headline(color: CColors.gray30),
                ),
                CIcon(
                  icon: 'arrow-game-right',
                  width: 16,
                  height: 16,
                  color: CColors.whiteStr,
                ),
              ],
            ),
          ),
          onPressed: _logout,
        ),
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
                  color: CColors.whiteStr,
                ),
              ],
            ),
          ),
          onPressed: _withdrawal,
        ),
      ],
    );
  }
}
