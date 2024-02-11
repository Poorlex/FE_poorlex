import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:poorlex/Libs/Theme.dart';
import 'package:poorlex/Controller/FindingFriends.dart';

class FindingFriends extends GetView {
  const FindingFriends({super.key});

  @override
  Widget build(BuildContext context) {
    List<List<String>> dummy = [
      ['김절약', '초보거지 김절약 입니다 :)'],
      ['박절약', '초보거지 박절약 입니다 :)'],
      ['이절약', '초보거지 이절약 입니다 :)'],
      ['정절약', '초보거지 정절약 입니다 :)'],
    ];

    FindingFriendsController con = Get.put(FindingFriendsController());
    con.updateSelectedItems(dummy);
    con.selectedFriends.value = [];
    return Scaffold(
        backgroundColor: CustomColors.black,
        appBar: AppBar(backgroundColor: CustomColors.black, title: Text('친구목록')),
        bottomNavigationBar: Container(
          width: double.infinity, height: 52, child:
          Obx(() => ElevatedButton(
              child: Text(
                  con.selectedFriends.value.length == 0 ? '확인' : '${con.selectedFriends.value.length} / 10 확인',
                  style: CustomTextStyles.Body3(CustomColors.black)),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(CustomColors.yellow)),
              onPressed: () {
                con.findingSelectedFrieds(dummy);
                print(con.selectedFriends.value);
                Navigator.pop(context);
              },
          )),
        ),
        body: Column(
          children: [
            if (dummy.length == 0) ...[
              SizedBox(height: 196),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 160, height: 160, child: Image.asset('assets/battle_page/IMG_NO_FRIENDS.png')),
              ]),
              SizedBox(height: 30),
              Text('친구목록이 없습니다.', style: CustomTextStyles.Title2(CustomColors.gray40))
            ] else ...[
              Padding(padding: EdgeInsets.symmetric(vertical: 9, horizontal: 20), child:
                Row(children: [
                    Text('내 거지친구', style: CustomTextStyles.Headline(CustomColors.white)),
                    SizedBox(width: 10),
                    Text('${dummy.length}', style: CustomTextStyles.Headline(CustomColors.purpleLight))
                  ],
                ),
              ),
              Expanded(child:
                ListView.builder(itemCount: dummy.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SizedBox(width: 70, child:
                        Row(children: [
                            Obx(() => InkWell(
                                  onTap: () => con.toggleSelection(index),
                                  child: Container(width: 24, height: 24,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(color: CustomColors.white),
                                      color: con.selectedItems[index] ? CustomColors.yellow : Colors.transparent, // 선택되지 않은 경우 투명
                                    ),
                                    child: con.selectedItems[index] ? Icon(Icons.check, size: 20, color: CustomColors.black) : null,
                                  ),
                            )),
                            SizedBox(width: 10), // 체크박스와 이미지 사이의 간격
                            Transform.translate(offset: Offset(10, 0), child:
                              Image.asset('assets/battle_page/IMG_PROFILE.png', width: 33, height: 40),
                            ),
                          ],
                        ),
                      ),
                      title: Column(children: [
                          Row(children: [
                              SizedBox(width: 16, height: 16, child:
                                Image.asset('assets/battle_page/ICON_LV2.png')
                              ),
                              SizedBox(width: 6),
                              Text(dummy[index][0], style: CustomTextStyles.Body3(CustomColors.white)),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Text(dummy[index][1], style: CustomTextStyles.Body3(CustomColors.white)),
                    );
                  },
                ),
              )
            ]
          ],
        ));
  }
}
