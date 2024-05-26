import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/battle_detail.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/schema/battle_notification_response/battle_notification_response.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';
import 'package:poorlex/widget/common/Icon.dart';
import 'package:poorlex/widget/common/app_bar.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/dialog/confirm_diolog.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
import 'package:poorlex/widget/common/user.dart';
import 'package:poorlex/widget/layout.dart';

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

  /// [TODO] mock data
  bool _isJoined = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _battleDetail.getDetailById(battleId: widget.battleId);
      _battleDetail.getBattleNotiById(battleId: widget.battleId);
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
        final battleInfo = _battleDetail.battleInfo.value;

        /// [MEMO] manager가 true이면 방장
        final manager =
            battleInfo.rankings.firstWhere((element) => element.manager);
        final battleNotiInfo = _battleDetail.battleNotiInfo.value;

        return Scaffold(
          appBar: _appBar(),
          body: Layout(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _titleArea(battleBudget: battleInfo.battleBudget),

                  /// [TODO] battleInfo에 메인이미지 없는지 확인
                  CImageNetwork(
                    errorAssetName: "assets/battle_detail/battle_image.png",
                    src: battleInfo.battleImageUrl,
                    height: 375,
                    width: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  _manager(manager: manager),
                  if (battleNotiInfo.content != null)
                    _notiArea(battleNotiInfo: battleNotiInfo),
                  _participantCount(
                    currentParticipantSize: battleInfo.currentParticipantSize,
                    maxParticipantSize: battleInfo.maxParticipantSize,
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: _bottomNavigationBar(),
        );
      },
    );
  }

  CAppBar _appBar() {
    return CAppBar(
      children: [
        Expanded(child: SizedBox(width: 1)),
        GestureDetector(
          onTap: () {
            Get.toNamed(
              '/friends',
              arguments: {
                'battleId': "${widget.battleId}",
              },
            );
          },
          child: CIcon(
            icon: 'add_friend',
            width: 26,
            height: 26,
          ),
        ),

        /// [TODO] 방 개설자 조건 넣기
        if (true) ...[
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
                            Get.toNamed(
                              '/battle/modify/${widget.battleId}',
                              // parameters: {
                              //   'battleId:': "${widget.battleId}",
                              // },
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
                            await confirmDialog(
                                context: context,
                                cancelText: '아니오',
                                confirmText: "네",
                                confirmFn: () {},
                                bodyText: "삭제를 진행하시겠습니끼?");
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
            "빚갚고 돈모으고 절약방",
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
    required ParticipantRankingResponse manager,
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
            description: "어디보세요 굴비보세요",
          ),
        ],
      ),
    );
  }

  Widget _notiArea({
    required BattleNotificationResponse battleNotiInfo,
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
          battleNotiInfo.content ?? '',
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

  Widget _bottomNavigationBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 11,
            bottom: 8,
            left: 24,
          ),
          color: CColors.gray20,
          child: Row(
            children: [
              UserItem(
                image: Image.asset('assets/sample/user.png'),
                icon: Image.asset('assets/sample/sample.png'),
                spaceWith: 30,
                name: '김굴비',
              ),
            ],
          ),
        ),
        CButton(
          color: CColors.yellow,
          padding: EdgeInsets.symmetric(vertical: 13.5),
          type: ButtonTypes.elevated,
          onPressed: () {
            setState(() {
              _isJoined = !_isJoined;
            });
          },
          child: SizedBox(
            height: 25,
            width: double.maxFinite,
            child: Text(
              _isJoined ? "참여취소" : "참여하기",
              style: CTextStyles.Title3(
                color: CColors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        )
      ],
    );
  }
}
