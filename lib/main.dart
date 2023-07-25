import 'package:flutter/material.dart';
import 'package:poorlex/Screen/my_page.dart';
// import 'package:poorlex/Screen/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
      // home: LandingPage(),
      // home: const MainPage(),
      home: const MyPage(),
    );
  }
}
