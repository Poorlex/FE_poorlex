import 'dart:ui';

import 'package:get/get.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/controller/layout.dart';

import 'package:poorlex/models/battle.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/finding_battle_response/finding_battle_response.dart';
import 'package:poorlex/schema/member_complete_battle_response/member_complete_battle_response.dart';
import 'package:poorlex/schema/member_progress_battle_response/member_progress_battle_response.dart';

class BattleController extends GetxController {
  final BattlesProvider battlesProvider;
  final LayoutController layout;
  final ImagePickerController imagePickerController;
  BattleController({
    required this.battlesProvider,
    required this.layout,
    required this.imagePickerController,
  });
  final _battleCreate = BattleCreateModel().obs;
  BattleCreateModel get battleCreate => _battleCreate.value;

  /// 탐색 배틀 리스트
  final _battleList = <FindingBattleResponse>[].obs;
  List<FindingBattleResponse> get battleList => _battleList;

  /// 참여중 배틀 리스트
  final _battleListInProgress = <MemberProgressBattleResponse>[].obs;
  List<MemberProgressBattleResponse> get battleListInProgress =>
      _battleListInProgress;

  /// 완료된 배틀 리스트
  final _battleListInCompleted = <MemberCompleteBattleResponse>[].obs;
  List<MemberCompleteBattleResponse> get battleListInCompleted =>
      _battleListInCompleted;

  /// battleCreate 초기화
  void initBattleCreate() {
    _battleCreate(BattleCreateModel());
  }

  void changeCurrent(int c) {
    _battleCreate.update((val) {
      val?.current = c;
    });
  }

  void changeDifficulty(EBattleDifficulty d) {
    _battleCreate.update((val) {
      val?.difficulty = d;
    });
  }

  void changeBudget(int b) {
    _battleCreate.update((val) {
      val?.budget = b;
    });
  }

  void changeCount(int c) {
    _battleCreate.update((val) {
      val?.count = c;
    });
  }

  void battleCreateChangeTitle(String c) {
    _battleCreate.update((val) {
      val?.title = c;
    });
  }

  void battleCreateChangeContent(String c) {
    _battleCreate.update((val) {
      val?.content = c;
    });
  }

  Future<void> getImage() async {
    final FileWithName? image = await imagePickerController.getImage();
    if (image != null) {
      _battleCreate.update((val) {
        val?.image = image;
      });
    }
  }

  Future<void> removeImage() async {
    _battleCreate.update((val) {
      val?.image = null;
    });
  }

  Future<void> getBattle() async {
    final [recruitingResponse, recruitingFinishedResponse] = await Future.wait([
      battlesProvider.getAll(
        status: [BattleStatus.RECRUITING],
      ),
      battlesProvider.getAll(
        status: [BattleStatus.RECRUITING_FINISHED],
      )
    ]);

    _battleList([
      ...recruitingResponse,
      ...recruitingFinishedResponse,
    ]);
  }

  Future<void> getBattleInProgress() async {
    final response = await battlesProvider.getProgress();
    _battleListInProgress(response);
  }

  Future<void> getBattleInComplete() async {
    final response = await battlesProvider.getComplete();
    _battleListInCompleted(response);
  }

  Future<bool> saveBattle() async {
    if (_battleCreate.value.image == null) return false;
    layout.setIsLoading(true);
    late bool response;
    try {
      response = await battlesProvider.createBattles(
        name: _battleCreate.value.title,
        introduction: _battleCreate.value.content,
        budget: _battleCreate.value.budget * 10000,
        maxParticipantSize: _battleCreate.value.count,
        image: _battleCreate.value.image!,
      );
    } catch (e) {
      response = false;
    }
    layout.setIsLoading(false);
    initBattleCreate();
    return response;
  }

  Rx<Color> budgetColor = Color(0xff999999).obs;

  // IndexTwo
  Rx<int> selectedIndexTwo = 0.obs;
  Rx<Color> indexTwoColor = Color(0xff999999).obs;

  // IndexThree
  Rx<int> selectedIndexThree = 0.obs;
  Rx<Color> indexThreeFirstColor = Color(0xff999999).obs;
  Rx<Color> indexThreeSecondColor = Color(0xff999999).obs;

  void changeBudgetColor(Color itemColor) {
    budgetColor.value = itemColor;
  }

  void indexTwoUpdate(int selected) {
    selectedIndexTwo.value = selected;
  }

  void changeIndexTwoColor(Color itemColor) {
    indexTwoColor.value = itemColor;
  }

  void changeIndexTwoColorToTen(Color itemColor) {
    indexTwoColor.value = itemColor;
  }

  void changeIndexThreeColor(int number) {
    selectedIndexThree.value = number;
    if (selectedIndexThree.value == 1) {
      indexThreeFirstColor.value = Color(0xffffd600);
      indexThreeSecondColor.value = Color(0xff999999);
    } else if (selectedIndexThree.value == 2) {
      indexThreeFirstColor.value = Color(0xff999999);
      indexThreeSecondColor.value = Color(0xffffd600);
    }
  }
}
