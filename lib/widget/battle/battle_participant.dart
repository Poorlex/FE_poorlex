import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle.dart';

import 'package:poorlex/libs/theme.dart';

class BattleParticipant extends GetView<BattleController> {
  BattleParticipant({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, idx) {
              return GestureDetector(
                  onTap: () {
                    Get.toNamed('/battle/ranking');
                  },
                  child: Column(
                    children: [
                      Container(
                          height: 150,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  /*
                                    Image.asset(
                                        width: 22,
                                        height: 14,
                                        'assets/my_page/${data[idx][0]}.png'),
                                     */
                                  SizedBox(width: 10),
                                  Text('${controller.battleList[idx].budget}만원',
                                      style: CTextStyles.Body3(
                                          color: CColors.yellow)),
                                  SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(1),
                                        color: CColors.red),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 6),
                                    child:
                                        Text('D-7', style: CTextStyles.Body3()),
                                  )
                                ],
                              ),
                              SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Text(
                                              '${controller.battleList[idx].name}',
                                              style: CTextStyles.Body2()))
                                    ],
                                  )),
                                  Container(
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              '${controller.battleList[idx].imageUrl}'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                      SizedBox(height: 10),
                    ],
                  ));
            },
            separatorBuilder: (context, idx) => SizedBox(width: 15),
            itemCount: controller.battleList.length,
          ),
        )
      ],
    );
  }
}
