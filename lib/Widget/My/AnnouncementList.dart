import 'package:flutter/material.dart';
import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Widget/Common/icon.dart';

class AnnounceMent extends StatefulWidget {
  const AnnounceMent({
    super.key,
  });

  @override
  State<AnnounceMent> createState() => _AnnounceMentState();
}

class _AnnounceMentState extends State<AnnounceMent> {
  final List<List<String>> announcements = [
    ['공지사항'],
    ['고객센터'],
    ['이용약관'],
    ['개인정보 처리방침'],
  ];

  final List<String> appVersion = ['앱 버전', 'U.0.0.0'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('공지사항', style: TextStyle(color: CustomColors.white, fontSize: 18)),
                TextButton(
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero,),
                  child: CustomIcon(icon: 'arrow-game-right', width: 16, height: 16, color: CustomColors.whiteStr,),
                  onPressed: () {},
                )
              ],
            ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('고객센터', style: TextStyle(color: CustomColors.white, fontSize: 18)),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero,),
                child: CustomIcon(icon: 'arrow-game-right', width: 16, height: 16, color: CustomColors.whiteStr),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('이용약관', style: TextStyle(color: CustomColors.white, fontSize: 18)),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero,),
                child: CustomIcon(icon: 'arrow-game-right', width: 16, height: 16, color: CustomColors.whiteStr),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('개인정보 처리방침', style: TextStyle(color: CustomColors.white, fontSize: 18)),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero,),
                child: CustomIcon(icon: 'arrow-game-right', width: 16, height: 16, color: CustomColors.whiteStr),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('앱 버전', style: TextStyle(color: CustomColors.white, fontSize: 18)),
              Text('U.0.0.0', style: TextStyle(color: CustomColors.white, fontSize: 18)),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('로그아웃', style: TextStyle(color: CustomColors.gray30, fontSize: 18)),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero,),
                child: CustomIcon(icon: 'arrow-game-right', width: 16, height: 16, color: CustomColors.gray30Str),
                onPressed: () {},
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('회원탈퇴', style: TextStyle(color: CustomColors.gray30, fontSize: 18)),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero,),
                child: CustomIcon(icon: 'arrow-game-right', width: 16, height: 16, color: CustomColors.gray30Str),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}
