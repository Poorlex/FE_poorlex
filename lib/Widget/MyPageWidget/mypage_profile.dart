import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:poorlex/Controller/user_controller.dart';
import 'package:poorlex/Widget/Common/user.dart';

class MyPageProfile extends StatelessWidget {
  MyPageProfile({super.key});

  final UserController _user = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              LevelProfile(level: 1),
              SizedBox(height: 18),
              Container(
                width: 300,
                child:
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('최지출', style: TextStyle(color: Colors.white, fontSize: 20))
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Text('돈을 많이 모아야 돈을 많이 쓸 수 있다.', textAlign: TextAlign.center, style: TextStyle(color: Color(0xff808080), fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  )
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child:
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
                      side: BorderSide(width: 1.0, color: Colors.amber),
                    ),
                    child: Container(
                      width: 210, height: 30,
                      child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('프로필 편집', style: TextStyle(color: Colors.amber, fontSize: 15)),
                            ],
                          )
                    ),
                    onPressed: () {},
                  )
              )
            ],
          ),
        ),
      ],
    );
  }
}
