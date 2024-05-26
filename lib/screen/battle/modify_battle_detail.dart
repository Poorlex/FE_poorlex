import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:poorlex/controller/modify_battle.dart';
import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/widget/battle/text_field/text_field.dart';
import 'package:poorlex/widget/common/app_bar.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/icon.dart';
import 'package:poorlex/widget/common/image/image_network.dart';
import 'package:poorlex/widget/layout.dart';

class ModifyBattleDetail extends StatefulWidget {
  const ModifyBattleDetail({
    super.key,
  });

  @override
  State<ModifyBattleDetail> createState() => _ModifyBattleDetailState();
}

class _ModifyBattleDetailState extends State<ModifyBattleDetail> {
  late final String? _battleId = Get.parameters["battleId"];
  late final TextEditingController _titleController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  late final TextEditingController _notiController = TextEditingController()
    ..addListener(() {
      setState(() {});
    });

  final FocusNode _notiFocusNode = FocusNode();

  final GlobalKey _notiKey = GlobalKey();

  late final ScrollController _scrollController = ScrollController();

  late final _modifyBattle = Get.find<ModifyBattleController>();

  void _scrollToContainer() {
    final context = _notiKey.currentContext;
    if (context != null) {
      final renderBox = context.findRenderObject() as RenderBox;
      final offset = renderBox.localToGlobal(Offset.zero);
      final scrollPosition = _scrollController.position;

      if (scrollPosition.pixels < offset.dy) {
        _scrollController.animateTo(310,
            duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
      }
    }
  }

  Future<void> _modifyDetail() async {
    final battleId = int.parse(_battleId!);
    _modifyBattle.modifyBattle(
      battleId: battleId,
      content: _notiController.text,
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_battleId != null) {
        final battleId = int.parse(_battleId!);
        _modifyBattle.getDetailById(
          battleId: battleId,
          updateTitle: (title) {
            _titleController.text = title;
            setState(() {});
          },
        );
        _modifyBattle.getBattleNotiById(
          battleId: battleId,
          updateNoti: (noti) {
            _notiController.text = noti;
            setState(() {});
          },
        );
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _notiController.dispose();
    _notiFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GestureDetector(
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: _appBar(),
            body: Layout(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 26),
                      _labelTitle(label: "배틀방 제목"),
                      SizedBox(height: 20),
                      TextField(
                        controller: _titleController,
                        cursorColor: CColors.yellow,
                        style: CTextStyles.Title3(color: CColors.white),
                        maxLength: 12,
                        decoration: InputDecoration(
                          hintText: '',
                          hintStyle: CTextStyles.Title3(color: CColors.gray41),
                          iconColor: CColors.yellow,
                          border: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CColors.yellow, width: 2.0),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CColors.yellow, width: 2.0),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: CColors.yellow, width: 2.0),
                          ),
                          counterText: '',
                        ),
                      ),
                      SizedBox(height: 40),
                      _labelTitle(label: "배틀방 사진"),
                      SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          _modifyBattle.getImage();
                        },
                        child: Container(
                          height: 93,
                          width: 93,
                          decoration: BoxDecoration(
                            color: CColors.gray10,
                          ),
                          child: Stack(
                            children: [
                              _modifyBattle.modifyImage.value != null
                                  ? Image.file(
                                      File(_modifyBattle
                                          .modifyImage.value!.path),
                                    )
                                  : CImageNetwork(
                                      src: _modifyBattle
                                          .battleInfo.value.battleImageUrl,
                                    ),
                              Positioned(
                                top: 0,
                                right: 0,
                                child: CIcon(
                                  icon: 'close-box',
                                  width: 16,
                                  height: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      _labelTitle(label: "배틀방 소개"),
                      SizedBox(height: 20),
                      CTextFieldContainer(
                        onTapField: _scrollToContainer,
                        key: _notiKey,
                        focusNode: _notiFocusNode,
                        textController: _notiController,
                        maxLength: 200,
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: _bottomNavigationBar(context: context),
          ),
        );
      },
    );
  }

  CAppBar _appBar() {
    return CAppBar(
      children: [
        Text(
          "배틀방 설정",
          style: CTextStyles.Body1(),
        ),
        IconButton(
          iconSize: 26,
          style: IconButton.styleFrom(
              padding: EdgeInsets.zero, minimumSize: Size.zero),
          icon: SizedBox(width: 1),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _labelTitle({
    required String label,
  }) {
    return Text(
      label,
      style: CTextStyles.Body3(
        color: CColors.gray50,
      ),
    );
  }

  Widget _bottomNavigationBar({
    required BuildContext context,
  }) {
    final bottomPaddingForIos = Platform.isIOS ? 8 : 0;
    final bottomOffset = MediaQuery.of(context).viewInsets.bottom +
        MediaQuery.of(context).padding.bottom +
        bottomPaddingForIos;
    return Padding(
      padding: EdgeInsets.only(bottom: bottomOffset),
      child: CButton(
        color: CColors.yellow,
        padding: EdgeInsets.symmetric(vertical: 13.5),
        type: ButtonTypes.elevated,
        onPressed: _modifyDetail,
        child: SizedBox(
          height: 25,
          width: double.maxFinite,
          child: Text(
            "수정",
            style: CTextStyles.Title3(
              color: CColors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
