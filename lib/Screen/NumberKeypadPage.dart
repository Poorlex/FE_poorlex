import 'package:flutter/material.dart';

class NumberKeypadPage extends StatefulWidget {
  const NumberKeypadPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NumberKeypadPageState createState() => _NumberKeypadPageState();
}

class _NumberKeypadPageState extends State<NumberKeypadPage> {
  final TextEditingController _controller = TextEditingController();

  void _onKeyPressed(String value) {
    setState(() {
      _controller.text += value;
    });
  }

  void _onDeletePressed() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _controller.text = _controller.text.substring(0, _controller.text.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              controller: _controller,
              readOnly: true,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white, // 흰색 텍스트 색상
                fontFamily: 'NeoDunggeunmoPro', // 폰트 지정
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.only(top:16, bottom:56),
              color: Colors.black,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(text: '1', onPressed: () => _onKeyPressed('1')),
                      NumberKey(text: '2', onPressed: () => _onKeyPressed('2')),
                      NumberKey(text: '3', onPressed: () => _onKeyPressed('3')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(text: '4', onPressed: () => _onKeyPressed('4')),
                      NumberKey(text: '5', onPressed: () => _onKeyPressed('5')),
                      NumberKey(text: '6', onPressed: () => _onKeyPressed('6')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(text: '7', onPressed: () => _onKeyPressed('7')),
                      NumberKey(text: '8', onPressed: () => _onKeyPressed('8')),
                      NumberKey(text: '90', onPressed: () => _onKeyPressed('9')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      NumberKey(text: '00', onPressed: () => _onKeyPressed('00')),
                      NumberKey(text: '0', onPressed: () => _onKeyPressed('0')),
                      NumberKey(text: '<-', onPressed: _onDeletePressed),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NumberKey extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const NumberKey({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110, // 네모 버튼의 너비
      height: 58, // 네모 버튼의 높이
      margin: const EdgeInsets.all(2), // 버튼 사이 간격을 위한 여백
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.black // 버튼의 배경색
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0), // 네모 버튼의 모서리를 조절
            ),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white, // 흰색 텍스트 색상
            fontFamily: 'NeoDunggeunmoPro', // 폰트 지정
          ),
        ),
      ),
    );
  }
}
