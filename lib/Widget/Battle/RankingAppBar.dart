import 'package:flutter/material.dart';

import 'package:poorlex/Libs/Theme.dart';

class RankingAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  RankingAppBarWidget({
    super.key
  }) : preferredSize = const Size.fromHeight(AppBarDesign.height);

  @override
  final Size preferredSize;

  @override
  _RankingAppBarWidgerState createState() => _RankingAppBarWidgerState();
}

class _RankingAppBarWidgerState extends State<RankingAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomColors.black,
      centerTitle: true,
      title: Text('참여중', style: CustomTextStyles.Body1(), textAlign: TextAlign.center),
      actions: [
        IconButton(
          onPressed: () {
            // todo: 설정페이지 제작 후 연결해주기
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ConfigPage(),
            //   ),
            // );
            /** 제작중 alert */
            showDialog(
                context: context,
                builder: (BuildContext ctx) {
                  return AlertDialog(
                    title: Text('설정'),
                    content: Text('설정페이지 제작 후 연결해주기'),
                    actions: [
                      TextButton(
                        child: Text('닫기'),
                        onPressed: () {
                          Navigator.pop(ctx);
                        }
                      ),
                    ],
                  );
                });
          },
          icon: Image.asset('assets/app_bar/icon_config_26_26.png'),
          iconSize: 26,
        ),
      ],
    );
  }
}
