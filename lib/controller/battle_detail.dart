import 'package:get/get.dart';
import 'package:poorlex/enums/day_of_week.dart';
import 'package:poorlex/main.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/battle_expenditure_response/battle_expenditure_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';
import 'package:poorlex/widget/common/dialog/common_alert.dart';

class BattleDetailController extends GetxController {
  final BattlesProvider battlesProvider;

  BattleDetailController({
    required this.battlesProvider,
  });

  final Rxn<BattleResponse> _battleInfo = Rxn<BattleResponse>();
  BattleResponse? get battleInfo => _battleInfo.value;

  final RxList<BattleExpenditureResponse> _battleExpenditures =
      <BattleExpenditureResponse>[].obs;
  List<BattleExpenditureResponse> get battleExpenditures => _battleExpenditures;

  final RxList<ParticipantRankingResponse> _battleRankings =
      <ParticipantRankingResponse>[].obs;
  List<ParticipantRankingResponse> get battleRankings => _battleRankings;

//   final Rx<BattleNotificationResponse> battleNotiInfo =
//       BattleNotificationResponse(
//     content: '''안녕하세요!!
// 자린고비입니다. 같이 일주일동안 돈 아껴보기 위해 방팠습니다.
// 뭘하고싶어도 같이 채팅하고 아껴봅시다...🙋‍♂️

// <<우리방규칙>>

// ✅ 채팅으로 출석 : 동기부여를 꼬옥 붙잡기위함
// ✅ 피드백 잊지않고 해주기 : 투표나 채팅시 서로 반응 꼭 해줘요..
//  ''',
//     imageUrl: null,
//   ).obs;

  Future<void> getDetailById({required int battleId}) async {
    try {
      final response = await battlesProvider.getDetailById(battleId: battleId);
      _battleInfo(response);
    } catch (e) {
      print(e);
    }
  }

  /// [참고] 에러 알럿 띄우기 참고
  Future<void> addParticipants({
    required int battleId,
  }) async {
    final response = await battlesProvider.addParticipants(battleId: battleId);
    response.fold(
      (l) {
        commonAlert(
          context: navigatorKey.currentContext!,
          message: l.message,
        );
      },
      (r) {
        getDetailById(battleId: battleId);
      },
    );
  }

  Future<void> deleteParticipants({
    required int battleId,
  }) async {
    await battlesProvider.deleteParticipants(battleId: battleId);
    getDetailById(battleId: battleId);
  }

  // Future<void> getBattleNotiById({
  //   required int battleId,
  // }) async {
  //   try {
  //     final response =
  //         await battlesProvider.getBattleNotification(battleId: battleId);

  //     if (response != null) {
  //       battleNotiInfo(response);
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  Future<void> getExpenditures({
    required int battleId,
    required DayOfWeek dayOfWeek,
  }) async {
    final response = await battlesProvider.getExpenditures(
      battleId: battleId,
      dayOfWeek: dayOfWeek,
    );
    _battleExpenditures(response);
  }

  Future<void> getMemberExpenditures({
    required int battleId,
  }) async {
    final response =
        await battlesProvider.getMemberExpenditures(battleId: battleId);
    _battleExpenditures(response);
  }

  Future<void> deleteBattle() async {
    if (_battleInfo.value != null) {
      await battlesProvider.deleteBattle(battleId: _battleInfo.value!.id);
    }
  }

  Future<void> getBattleRankings({
    required int battleId,
  }) async {
    final response =
        await battlesProvider.getBattleRankings(battleId: battleId);
    _battleRankings(response);
  }
}
