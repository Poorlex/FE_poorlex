import 'package:flutter/material.dart';
import 'package:poorlex/Screen/budget_page.dart';

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
      backgroundColor: Colors.black,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.flag, size: 16),
                        const SizedBox(
                          width: 16,
                        ),
                        Text('70,000원', style: TextStyle(fontSize: 16)),
                        const SizedBox(
                          width: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.grey.shade700,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 1),
                            child: Text('D-7', style: TextStyle(fontSize: 14)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 133,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings, size: 16),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'LV.4',
                  style: TextStyle(color: Color(0xffFFD600), fontSize: 16),
                ),
                Text('Progress Bar'),
                Text(
                  '+256 P',
                  style: TextStyle(color: Color(0xffFFD600), fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Image.asset('assets/coin.png'),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    TextButton(
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
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.resolveWith<Color>((states) {
                          return Colors.transparent; // 포커스 색상을 투명하게 설정합니다.
                        }),
                      ),
                      child: Text(battleMoney,
                          style: TextStyle(
                              fontSize: 20, color: Color(0xffFFD600))),
                    )
                  ],
                ),
                const Text(
                  '-32,000원',
                  style: TextStyle(color: Color(0xffB265FF), fontSize: 16),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
