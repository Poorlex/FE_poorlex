import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/controller/modal.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/libs/theme.dart';

class ShowModal extends StatefulWidget {
  const ShowModal({
    super.key,
  });

  @override
  State<ShowModal> createState() => _ShowModalState();
}

class _ShowModalState extends State<ShowModal> {
  // [MEMO] 잘못된 가져오기 방식 동작확인 필요
  final ModalController _modal = Get.put(ModalController());
  final UserController _user = Get.find<UserController>();

  late int stageLevel = 0;

  @override
  Widget build(BuildContext context) {
    void addLevel() {
      setState(() {
        stageLevel = stageLevel + 1;
      });
    }

    return Column(children: [
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: 400,
          decoration: BoxDecoration(color: CColors.black),
          child: Column(children: [
            SizedBox(height: 20),
            if (_modal.modalCount().modalCount == 0)
              Column(children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child:
                                  Text('고수거지:', style: CTextStyles.Headline())),
                          SizedBox(height: 8),
                          Row(children: [
                            Text('반갑네', style: CTextStyles.Headline()),
                            SizedBox(width: 10),
                            Text('${_user.userInfo().nickname}!',
                                style:
                                    CTextStyles.Title3(color: CColors.yellow)),
                          ]),
                          SizedBox(height: 10),
                          Text('신입 거지로 들어온 것을 환영하네.',
                              style: CTextStyles.Headline()),
                          SizedBox(height: 10),
                        ]),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 60),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: CColors.yellow,
                        padding: EdgeInsets.symmetric(
                            horizontal: 120, vertical: 16)),
                    child: Text('안녕하세요!',
                        style: CTextStyles.Headline(color: CColors.black)),
                    onPressed: () {
                      addLevel();
                      _modal.increase();
                    },
                  ),
                ),
              ]),
            if (_modal.modalCount().modalCount == 1) ...[
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: Text('고수거지:',
                                    style: CTextStyles.Headline()),
                              ),
                              SizedBox(height: 8),
                              Row(children: [
                                Text('이 동네 거지들은 모두',
                                    style: CTextStyles.Headline()),
                                SizedBox(width: 10)
                              ]),
                              SizedBox(height: 10),
                              Row(children: [
                                Text('각자 원하는 삶을 위해',
                                    style: CTextStyles.Headline(
                                        color: CColors.yellow)),
                                Text(' 열심히 라네.', style: CTextStyles.Headline())
                              ]),
                              SizedBox(height: 10),
                              Text('힘들고 슬플 때도 있겠지만,',
                                  style: CTextStyles.Headline()),
                              SizedBox(height: 10),
                              Text('함께 웃고 웃으며 살아가고 있지',
                                  style: CTextStyles.Headline())
                            ]),
                      ),
                    ]),
                    SizedBox(height: 60),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: CColors.yellow,
                            padding: EdgeInsets.symmetric(
                                horizontal: 125, vertical: 16)),
                        child: Text('그렇군요',
                            style: CTextStyles.Headline(color: CColors.black)),
                        onPressed: () {
                          addLevel();
                          _modal.increase();
                        },
                      ),
                    ])
                  ]),
            ],
            if (_modal.modalCount().modalCount == 2)
              Column(children: [
                Row(children: [
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('고수거지:', style: CTextStyles.Headline()),
                          SizedBox(height: 8),
                          Row(children: [
                            Text('자! 그럼 자네도 우선', style: CTextStyles.Headline()),
                            SizedBox(width: 10),
                          ]),
                          SizedBox(height: 8),
                          Text('열심히 돈을 모을 수 있도록.',
                              style:
                                  CTextStyles.Headline(color: CColors.yellow)),
                          SizedBox(height: 8),
                          Row(children: [
                            Text('진정 원하던 삶이 무엇인지',
                                style: CTextStyles.Headline()),
                          ]),
                          SizedBox(height: 8),
                          Text('다시 돌이켜보는 시간을 가져보게나.',
                              style: CTextStyles.Headline()),
                        ]),
                  ),
                ]),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CColors.yellow,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 16)),
                            child: Text('알겠어요',
                                style:
                                    CTextStyles.Headline(color: CColors.black)),
                            onPressed: () {}),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: CColors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16)),
                          child: Text('다음에요', style: CTextStyles.Headline()),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ]),
                )
              ]),
          ]),
        )
      ]),
    ]);
  }
}
