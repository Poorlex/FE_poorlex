import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final int proValue = 10;
  final int value = 0;

  const NavBar({
    super.key,
  });

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.flag),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          '70,000원',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.grey.shade700,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 1),
                            child: Text('D-7'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 161,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
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
                  style: TextStyle(color: Colors.amber),
                ),
                Text('Progress Bar'),
                Text(
                  '+256P',
                  style: TextStyle(color: Colors.amber),
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
                      height: 30,
                      width: 30,
                      child: Image.asset('assets/coin.png'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Text('38,000'),
                  ],
                ),
                Text('-32,000원',
                    style: TextStyle(
                      color: Colors.purple.shade300,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(130);
}
