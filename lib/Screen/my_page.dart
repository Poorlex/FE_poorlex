import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.settings),
                iconSize: 35,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_rounded),
                iconSize: 35,
              )
            ],
          ),
        ),
        body: const Center(
          child: Text('hello world',
              style: TextStyle(
                color: Colors.white,
              )),
        ));
  }
}
