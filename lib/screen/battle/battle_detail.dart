import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle_detail.dart';
import 'package:poorlex/controller/user.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/battle_manage_response/battle_manage_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';
import 'package:poorlex/widget/common/Icon.dart';
import 'package:poorlex/widget/common/app_bar.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/dialog/confirm_dialog.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
import 'package:poorlex/widget/common/user.dart';
import 'package:poorlex/widget/gnb_layout.dart';
import 'package:poorlex/widget/layout.dart';
import 'package:poorlex/widget/level/medal.dart';
import 'package:poorlex/widget/level/profile.dart';
import 'package:poorlex/widget/loading_screen.dart';

class BattleDetail extends StatefulWidget {
  final int battleId;
  const BattleDetail({
    super.key,
    required this.battleId,
  });

  @override
  State<BattleDetail> createState() => _BattleDetailState();
}

class _BattleDetailState extends State<BattleDetail> {
  late final _battleDetail = Get.find<BattleDetailController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _battleDetail.getDetailById(battleId: widget.battleId);
      _battleDetail.getBattleRankings(battleId: widget.battleId);
      // _battleDetail.getBattleNotiById(battleId: widget.battleId);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final battleRankings = _battleDetail.battleRankings;

        final battleInfo = _battleDetail.battleInfo;
        if (battleInfo == null) {
          return LoadingScreen();
        }

        /// [MEMO] manager가 true이면 방장
        final manager = battleInfo.battleManager;

        return Scaffold(
          appBar: _appBar(manager: manager),
          body: Layout(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _titleArea(
                    battleBudget: battleInfo.battleBudget,
                    battleName: battleInfo.battleName,
                  ),
                  CImageNetwork(
                    errorAssetName: "assets/battle_detail/battle_image.png",
                    src: battleInfo.battleImageUrl,
                    height: 375,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  _manager(manager: manager),
                  _introduction(
                    battleIntroduction: battleInfo.battleIntroduction,
                  ),
                  _participantCount(
                    currentParticipantSize: battleInfo.currentParticipantSize,
                    maxParticipantSize: battleInfo.maxParticipantSize,
                  ),
                  ..._rankingsWidget(battleRankings: battleRankings),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _bottomNavigationBar(battleInfo: battleInfo),
        );
      },
    );
  }

  CAppBar _appBar({required BattleManageResponse manager}) {
    final user = Get.find<UserController>();
    final isManager = user.userInfo?.nickname == manager.nickname;
    return CAppBar(
      children: [
        Expanded(child: SizedBox(width: 1)),
        // GestureDetector(
        //   onTap: () {
        //     Get.toNamed(
        //       '/friends',
        //       arguments: {
        //         'battleId': "${widget.battleId}",
        //       },
        //     );
        //   },
        //   child: CIcon(
        //     icon: 'add_friend',
        //     width: 26,
        //     height: 26,
        //   ),
        // ),

        /// [TODO] 방 개설자 조건 넣기
        if (isManager) ...[
          SizedBox(width: 10),
          GestureDetector(
            onTap: () async {
              await showModalBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(),
                useRootNavigator: true,
                backgroundColor: CColors.black,
                builder: (context) {
                  return Container(
                    height: 184,
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pop();
                            await Get.toNamed(
                              '/battle/modify/${widget.battleId}',
                            );
                            _battleDetail.getDetailById(
                              battleId: widget.battleId,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              "수정",
                              style: CTextStyles.Headline(
                                color: CColors.yellow,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            Navigator.of(context).pop();

                            /// [MEMO] result 결과에 따른 다음 동작 구현 필요
                            final result = await confirmDialog(
                              context: context,
                              cancelText: '아니오',
                              confirmText: "네",
                              bodyText: "삭제를 진행하시겠습니끼?",
                            );

                            if (result == true && mounted) {
                              await _battleDetail.deleteBattle();
                              Get.offAndToNamed(
                                "/battle",
                                id: GNBLayout.globalKey,
                              );
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Text(
                              "삭제",
                              style: CTextStyles.Headline(
                                color: CColors.gray40,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: CIcon(
              icon: 'more',
              width: 26,
              height: 26,
            ),
          ),
        ]
      ],
    );
  }

  Widget _titleArea({
    required int battleBudget,
    required String battleName,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 22,
        horizontal: 24,
      ),
      child: Row(
        children: [
          CImageAsset(
            name: "assets/battle_detail/${battleBudget}won.png",
            width: 36,
            height: 36,
          ),
          SizedBox(width: 10),
          Text(
            "$battleName",
            style: TextStyle(
              color: CColors.white,
              fontSize: 18,
            ),
          )
        ],
      ),
    );
  }

  Widget _manager({
    required BattleManageResponse manager,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 11,
        horizontal: 24,
      ),
      child: Row(
        children: [
          UserItem(
            image: Image.asset(imageAssetsByLevels[manager.level - 1]),
            icon: Image.asset('assets/sample/sample.png'),
            name: manager.nickname,
            description: manager.description,
          ),
        ],
      ),
    );
  }

  Widget _introduction({
    required String battleIntroduction,
  }) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 16,
      ),
      child: Container(
        padding: EdgeInsets.all(6),
        color: CColors.gray10,
        child: Text(
          battleIntroduction,
          style: CTextStyles.Body3(),
        ),
      ),
    );
  }

  Widget _participantCount({
    required int currentParticipantSize,
    required int maxParticipantSize,
  }) {
    return Container(
      padding: EdgeInsets.only(top: 9, bottom: 9, left: 24),
      child: Row(
        children: [
          CImageAsset(
            name: "assets/ranking/icon_people_20_20.png",
            width: 20,
            height: 20,
          ),
          SizedBox(width: 2),
          Text(
            "$currentParticipantSize/$maxParticipantSize",
            style: CTextStyles.Caption2(),
          )
        ],
      ),
    );
  }

  List<Widget> _rankingsWidget({
    required List<ParticipantRankingResponse> battleRankings,
  }) {
    final user = Get.find<UserController>().userInfo;
    return battleRankings.map((e) {
      final label = e.level;
      return Container(
        padding: EdgeInsets.only(
          top: 11,
          bottom: 8,
          left: 24,
        ),
        color: user?.nickname == e.nickname ? CColors.gray20 : null,
        child: Row(
          children: [
            CProfile(
              level: label,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 30),
            CLevelMedal(
              level: label,
              width: 16,
              height: 16,
            ),
            SizedBox(width: 6),
            Text("${e.nickname}", style: CTextStyles.Body3()),
          ],
        ),
      );
    }).toList();
  }

  Widget? _bottomNavigationBar({
    required BattleResponse battleInfo,
  }) {
    final user = Get.find<UserController>().userInfo;
    if (battleInfo.battleManager.nickname == user?.nickname) {
      return null;
    }
    return CButton(
      color: CColors.yellow,
      padding: EdgeInsets.symmetric(vertical: 13.5),
      type: ButtonTypes.elevated,
      onPressed: battleInfo.isParticipating
          ? () async {
              await _battleDetail.deleteParticipants(
                battleId: widget.battleId,
              );
            }
          : () async {
              await _battleDetail.addParticipants(
                battleId: widget.battleId,
              );
            },
      child: SizedBox(
        height: 25,
        width: double.maxFinite,
        child: Text(
          battleInfo.isParticipating ? "참여취소" : "참여하기",
          style: CTextStyles.Title3(
            color: CColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
