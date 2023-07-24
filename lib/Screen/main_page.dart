import 'package:flutter/material.dart';
import 'package:poorlex/Widget/nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
      home: const Scaffold(
        appBar: NavBar(),
        body: Column(
          children: [
            Flexible(
              child: Center(
                child: Text('hello'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
