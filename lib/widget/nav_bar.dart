import 'package:flutter/material.dart';
import 'package:poorlex/libs/theme.dart';

import 'package:poorlex/screen/budget/budget_page.dart';

// TODO: battleMoney 상태변경을 위해 StatelessWidget 위젯을 StatefulWidget 위젯으로 변경
class NavBar extends StatefulWidget implements PreferredSizeWidget {
  final int proValue = 10;
  final int value = 0;

  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();

  @override
  Size get preferredSize => const Size.fromHeight(130);
}

class _NavBarState extends State<NavBar> {
  String battleMoney = "POORLEX";
  @override
  Widget build(BuildContext context) {
    return AppBar(
        toolbarHeight: 120,
        backgroundColor: CColors.black,
        title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.flag, size: 16),
                        SizedBox(width: 16),
                        Text('70,000원',
                            style: CTextStyles.Body2(color: CColors.black)),
                        SizedBox(width: 16),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: CColors.gray41),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 1),
                            child: Text('D-7',
                                style: CTextStyles.Body3(color: CColors.black)),
                          ),
                        ),
                      ]),
                ]),
                SizedBox(width: 133),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: IconButton(
                    icon: Icon(Icons.settings, size: 16),
                    onPressed: () {},
                  ),
                ),
              ]),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('LV.4', style: CTextStyles.Body2(color: CColors.yellow)),
                  Text('Progress Bar'),
                  Text('+256 P',
                      style: CTextStyles.Body2(color: CColors.yellow)),
                ],
              ),
              SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(children: [
                  SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset('assets/coin.png')),
                  SizedBox(width: 12),
                  TextButton(
                    style: ButtonStyle(overlayColor:
                        MaterialStateProperty.resolveWith((states) {
                      return Colors.transparent; // 포커스 색상을 투명하게 설정합니다.
                    })),
                    child: Text(battleMoney,
                        style: CTextStyles.Headline(color: CColors.yellow)),
                    onPressed: () async {
                      final result = await Navigator.push<String>(
                        context,
                        MaterialPageRoute(builder: (context) => BudgetPage()),
                      );
                      if (result != null) {
                        setState(() {
                          battleMoney = result;
                        });
                      }
                    },
                  )
                ]),
                Text('-32,000원',
                    style: CTextStyles.Body2(color: CColors.purpleLight)),
              ])
            ])));
  }
}
