import 'package:flutter/material.dart';
import 'package:poorlex/Widget/main_carousel.dart';
import 'package:poorlex/Widget/nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
      home: Scaffold(
        appBar: const NavBar(),
        body: Column(
          children: [
            Flexible(
              flex: 3,
              child: Container(color: Colors.blue),
            ),
            const Flexible(
              flex: 3,
              child: Center(
                child: MainCarousel(),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
