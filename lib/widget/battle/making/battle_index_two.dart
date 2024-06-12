import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:poorlex/libs/theme.dart';
import 'package:poorlex/controller/battle.dart';
import 'package:poorlex/widget/common/buttons.dart';
import 'package:poorlex/widget/common/image/image_asset.dart';

class BattleIndexTwo extends StatelessWidget {
  BattleIndexTwo({super.key});

  final BattleController battle = Get.find<BattleController>();

  Widget _buildWrap(List<int> items, int selectedIndex) {
    return Wrap(
      spacing: 16.0,
      children: items.map((item) {
        var count = battle.battleCreate.value.count;
        return CButton(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            color: count == item ? CColors.yellow : CColors.gray41,
            type: ButtonTypes.outlined,
            child: Text('${item}명',
                style: CTextStyles.Body3(
                    color: count == item ? CColors.yellow : CColors.gray41)),
            onPressed: () => battle.changeCount(item));
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text('몇명이 참여하나요?', style: CTextStyles.Title2()),
              SizedBox(width: 4),
              GestureDetector(
                onTap: () =>
                    _EarnedPointsByPersonnelGuide.show(context: context),
                child:
                    Icon(Icons.help_outline, color: CColors.gray40, size: 14),
              )
            ],
          ),
        ),
        SizedBox(height: 20),
        Text('1등하면 20점!', style: CTextStyles.Body2(color: CColors.gray41)),
        SizedBox(height: 20),
        Obx(() => _buildWrap([1, 2, 3, 4, 5], battle.selectedIndexTwo.value)),
        SizedBox(height: 40),
        Text('1등하면 30점!', style: CTextStyles.Body2(color: CColors.gray41)),
        SizedBox(height: 20),
        Obx(() => _buildWrap([6, 7, 8, 9, 10], battle.selectedIndexTwo.value)),
      ],
    );
  }
}

class _EarnedPointsByPersonnelGuide extends StatelessWidget {
  const _EarnedPointsByPersonnelGuide();

  static Future<void> show({
    required BuildContext context,
  }) async {
    return await showDialog<void>(
      context: context,
      builder: (context) => _EarnedPointsByPersonnelGuide(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 343,
        height: 318,
        decoration: BoxDecoration(color: CColors.gray10),
        child: Stack(
          children: [
            CImageAsset(
              name: "assets/battle_page/earned_points.png",
            ),
            Positioned(
              top: 6,
              right: 6,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.close,
                  color: CColors.white,
                  size: 32,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
