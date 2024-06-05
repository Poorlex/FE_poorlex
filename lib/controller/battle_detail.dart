import 'package:get/get.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/battle_notification_response/battle_notification_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';

class BattleDetailController extends GetxController {
  final BattlesProvider battlesProvider;
  final LayoutController layout;
  BattleDetailController({
    required this.battlesProvider,
    required this.layout,
  });

  final Rx<BattleResponse> battleInfo = BattleResponse(
    battleImageUrl: '',
    battleName: '',
    maxParticipantSize: 0,
    currentParticipantSize: 0,
    battleBudget: 0,
    battleDDay: 0,
    rankings: [
      ParticipantRankingResponse(
        rank: 1,
        level: 1,
        nickname: '주노',
        expenditure: 1000,
        manager: true,
      ),
      ParticipantRankingResponse(
        rank: 2,
        level: 1,
        nickname: 'rogan',
        expenditure: 2000,
        manager: false,
      ),
    ],
  ).obs;

  final Rx<BattleNotificationResponse> battleNotiInfo =
      BattleNotificationResponse(
    content: '''안녕하세요!!
자린고비입니다. 같이 일주일동안 돈 아껴보기 위해 방팠습니다. 
뭘하고싶어도 같이 채팅하고 아껴봅시다...🙋‍♂️

<<우리방규칙>>

✅ 채팅으로 출석 : 동기부여를 꼬옥 붙잡기위함
✅ 피드백 잊지않고 해주기 : 투표나 채팅시 서로 반응 꼭 해줘요..
 ''',
    imageUrl: null,
  ).obs;

  Future<void> getDetailById({required int battleId}) async {
    layout.setIsLoading(true);
    try {
      final response = await battlesProvider.getDetailById(
          battleId: battleId, date: DateTime.now());
      battleInfo(response);
    } catch (e) {
      print(e);
    }
    layout.setIsLoading(false);
  }

  Future<void> getBattleNotiById({
    required int battleId,
  }) async {
    try {
      final response =
          await battlesProvider.getBattleNotification(battleId: battleId);

      if (response != null) {
        battleNotiInfo(response);
      }
    } catch (e) {
      print(e);
    }
  }
}
