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

  Future<void> getBattle() async {
    /// [MOCK DATA]
    _battleList(
      [
        FindingBattleResponse(
          battleId: 1,
          name: "빚갚고 돈모으고 절약방",
          introduction: "혼자 갚지말고 같이 갚아요 ",
          imageUrl: "https://i.ibb.co/zbszqzW/1.png",
          difficulty: "difficulty",
          budget: 50000,
          currentParticipant: 1,
          maxParticipantCount: 7,
        ),
        FindingBattleResponse(
          battleId: 2,
          name: "월급때까지 존버하는 방",
          introduction: "월급날 텅장 되기 싫으면 들어와 너 거진거 너 빼고 다 알아 ,,☺️",
          imageUrl: "https://i.ibb.co/FhcsQ8J/2.png",
          difficulty: "difficulty",
          budget: 140000,
          currentParticipant: 7,
          maxParticipantCount: 10,
        ),
        FindingBattleResponse(
          battleId: 3,
          name: "과소비 포비아",
          introduction: "돈모은다며 여행간다며 차산다며",
          imageUrl: "https://i.ibb.co/KqQtgPr/3.png",
          difficulty: "difficulty",
          budget: 150000,
          currentParticipant: 3,
          maxParticipantCount: 10,
        ),
      ],
    );
    // final response = await battlesProvider.getAll(
    //   status: [BattleStatus.RECRUITING, BattleStatus.RECRUITING_FINISHED],
    // );
    // _battleList(response);
  }

  Future<void> getBattleInProgress() async {
    /// [MOCK DATA]
    _battleListInProgress(
      [
        MemberProgressBattleResponse(
          battleId: 1,
          name: '빚갚고 돈모으고 절약방',
          imageUrl: 'https://i.ibb.co/zbszqzW/1.png',
          difficulty: 'difficulty',
          budgetLeft: 50000,
          currentParticipantRank: 3,
          battleParticipantCount: 10,
          uncheckedAlarmCount: 2,
          dday: 7,
        ),
        MemberProgressBattleResponse(
          battleId: 2,
          name: '월급때까지 존버하는 방',
          imageUrl: 'https://i.ibb.co/FhcsQ8J/2.png',
          difficulty: 'difficulty',
          budgetLeft: 70000,
          currentParticipantRank: 1,
          battleParticipantCount: 5,
          uncheckedAlarmCount: 2,
          dday: 7,
        ),
        MemberProgressBattleResponse(
          battleId: 3,
          name: '과소비 포비아',
          imageUrl: 'https://i.ibb.co/KqQtgPr/3.png',
          difficulty: 'difficulty',
          budgetLeft: 130000,
          currentParticipantRank: 2,
          battleParticipantCount: 3,
          uncheckedAlarmCount: 2,
          dday: 7,
        ),
      ],
    );

    // final response = await battlesProvider.getProgress();
    // _battleListInProgress(response);
  }

  Future<void> getBattleInComplete() async {
    /// [MOCK DATA]
    _battleListInCompleted(
      [
        MemberCompleteBattleResponse(
          battleId: 1,
          name: "함께하는 거지라이프",
          imageUrl: "https://i.ibb.co/8gQGYVH/1.png",
          difficulty: "HARD",
          pastDay: 14,
          budgetLeft: 58000,
          currentParticipantRank: 1,
          battleParticipantCount: 3,
          earnedPoint: 20,
        ),
        MemberCompleteBattleResponse(
          battleId: 2,
          name: "삼김으로 존버",
          imageUrl: "https://i.ibb.co/WVg5541/image.png",
          difficulty: "HARD",
          pastDay: 14,
          budgetLeft: 50000,
          currentParticipantRank: 2,
          battleParticipantCount: 3,
          earnedPoint: 20,
        ),
        MemberCompleteBattleResponse(
          battleId: 3,
          name: "삼김으로 존버",
          imageUrl: "https://i.ibb.co/0ZV54Ws/image.png",
          difficulty: "HARD",
          pastDay: 14,
          budgetLeft: 58000,
          currentParticipantRank: 3,
          battleParticipantCount: 10,
          earnedPoint: 0,
        ),
        MemberCompleteBattleResponse(
          battleId: 3,
          name: "삼김으로 존버",
          imageUrl: "https://i.ibb.co/0ZV54Ws/image.png",
          difficulty: "HARD",
          pastDay: 14,
          budgetLeft: 58000,
          currentParticipantRank: 4,
          battleParticipantCount: 10,
          earnedPoint: 0,
        ),
        MemberCompleteBattleResponse(
          battleId: 3,
          name: "존버,,",
          imageUrl: "https://i.ibb.co/0ZV54Ws/image.png",
          difficulty: "HARD",
          pastDay: 14,
          budgetLeft: 5000,
          currentParticipantRank: 10,
          battleParticipantCount: 10,
          earnedPoint: 0,
        ),
      ],
    );
    // final response = await battlesProvider.getComplete();
    // _battleListInComplete(response);
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
