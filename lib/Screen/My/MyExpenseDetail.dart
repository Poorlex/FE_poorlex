import 'package:flutter/material.dart';

import 'package:poorlex/Widget/Common/Icon.dart';
import 'package:poorlex/Widget/Common/BottomBar.dart';

import 'package:poorlex/Libs/Theme.dart';

class MyExpenseDetailPage extends StatefulWidget {
  const MyExpenseDetailPage({super.key});

  @override
  State<MyExpenseDetailPage> createState() => _MyExpenseDetailPageState();
}

class _MyExpenseDetailPageState extends State<MyExpenseDetailPage> {
  Function onClickOption = (BuildContext context) {
    Function selectOption = (String mode) {
      print(mode);
    };
    showModalBottomSheet(
      context: context,
      backgroundColor: CColors.black,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return OptionButtonModal(selectOption: selectOption);
      },
    );
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.black,
      bottomNavigationBar: BottomBar(nowPage: 4),
      appBar: AppBar(
        backgroundColor: CColors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              iconSize: 26, style: IconButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
              icon: CIcon(icon: 'arrow-left', width: 26, height: 26, color: CColors.whiteStr),
              onPressed: () {},
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('2023.08.12 (일)', style: CTextStyles.Caption1(color: CColors.gray50)),
                SizedBox(height: 6),
                Text('24,370원', style: CTextStyles.Headline()),
              ]
            ),
            IconButton(
              iconSize: 26, style: IconButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
              icon: CIcon(icon: 'option', width: 26, height: 26, color: CColors.whiteStr),
              onPressed: () => onClickOption(context),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child:
          SingleChildScrollView(
            child:
              Container(
                padding: EdgeInsets.symmetric(vertical: 34, horizontal: 20),
                child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('''
오늘도 고생했다!
힘들었지만 괜찮아 ㅎㅎ
                      ''', style: CTextStyles.Body3()
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child:
                              SizedBox(child:
                                Image.asset('assets/sample/sample2.png'),
                              ),
                          )
                        ]
                      ),
                      SizedBox(height: 24),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child:
                                SizedBox(child:
                                  Image.asset('assets/sample/sample2.png'),
                                ),
                            )
                          ]
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
              ),
          ),
      ),
    );
  }
}

class OptionButtonModal extends StatelessWidget {
  Function selectOption;
  OptionButtonModal({
    super.key,
    required this.selectOption
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 150,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: TextButton(
                    onPressed: () => print(1111),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('수정', style: CTextStyles.Headline(color: CColors.yellow))
                        ]
                    ),
                  )
              ),
              Expanded(
                  child: TextButton(
                    onPressed: () => print(1111),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('삭제', style: CTextStyles.Headline(color: CColors.gray30))
                        ]
                    ),
                  )
              ),
            ],
          ),
        )
    );
  }
}
