import 'package:get/get.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/battle_notification_response/battle_notification_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';

class BattleDetailController extends GetxController {
  final BattlesProvider battlesProvider;

  BattleDetailController({
    required this.battlesProvider,
  });

  final Rxn<BattleResponse> battleInfo = Rxn<BattleResponse>();

  /// [MEMO] 1차 배포에서는 사용하지 않음.
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
      battleInfo(response);
    } catch (e) {
      print(e);
    }
  }

  Future<void> addParticipants({
    required int battleId,
  }) async {
    try {
      final response =
          await battlesProvider.addParticipants(battleId: battleId);
      if (response) {
        getDetailById(battleId: battleId);
      }
    } catch (e) {
      print(e);
    }
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
}
