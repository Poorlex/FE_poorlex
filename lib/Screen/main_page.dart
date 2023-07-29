import 'package:flutter/material.dart';
import 'package:poorlex/Widget/MainPageWidget/show_modal.dart';
import 'package:poorlex/Widget/nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    super.key,
  });

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      show(context);
    });
  }

  void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const ShowModal();
      },
    );
  }

  int modalValue = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'NeoDunggeunmoPro-Regular'),
      home: Scaffold(
        appBar: const NavBar(),
        body: Column(
          children: [
            if (modalValue == 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {
                        show(context);
                      },
                      icon: const Icon(Icons.abc)),
                ],
              ),
            Flexible(
              flex: 3,
              child: Row(
                children: [
                  Container(color: Colors.blue),
                ],
              ),
            ),
            // const Flexible(
            //   flex: 3,
            //   child: Center(
            //     child: MainCarousel(),
            //   ),
            // ),
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
