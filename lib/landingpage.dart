import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/img_main_login.png')),
            SizedBox(height: 50),
            Text('풀렉스에서 다른 거지 친구들과 함께', 
              style: TextStyle(fontSize: 16),),
            Text('재미있게 절약해요',
              style: TextStyle(fontSize: 16),),
            SizedBox(height: 150),
          ]
        )
      )
    );
  }
}