import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:poorlex/controller/image_picker.dart';
import 'package:poorlex/controller/layout.dart';
import 'package:poorlex/provider/battles_provider.dart';
import 'package:poorlex/schema/battle_notification_response/battle_notification_response.dart';
import 'package:poorlex/schema/battle_response/battle_response.dart';
import 'package:poorlex/schema/participant_ranking_response/participant_ranking_response.dart';

class ModifyBattleController extends GetxController {
  final BattlesProvider battlesProvider;
  final LayoutController layout;
  final ImagePickerController imagePickerController;
  ModifyBattleController({
    required this.battlesProvider,
    required this.layout,
    required this.imagePickerController,
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

  /// 수정할 배틀 이미지 사진
  final Rxn<XFile> modifyImage = Rxn<XFile>();

  Future<void> getDetailById({
    required int battleId,
    required void Function(String title) updateTitle,
  }) async {
    layout.setIsLoading(true);
    try {
      final response = await battlesProvider.getDetailById(
        battleId: battleId,
        date: DateTime.now(),
      );
      if (response != null) {
        print(response);
        battleInfo(response);
        updateTitle(response.battleName);
      }
    } catch (e) {
      print(e);
    }
    layout.setIsLoading(false);
  }

  Future<void> getBattleNotiById({
    required int battleId,
    required void Function(String noti) updateNoti,
  }) async {
    try {
      final response =
          await battlesProvider.getBattleNotification(battleId: battleId);

      if (response != null) {
        battleNotiInfo(response);
        updateNoti(response.content ?? '');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getImage() async {
    final XFile? image = await imagePickerController.getImage();
    if (image != null) {
      modifyImage(image);
    }
  }

  /// [MEMO] api 없음.
  /// 배틀방 설정 바꾸는 api존재하지않음.
  Future<void> modifyBattle({
    required int battleId,
    required String content,
  }) async {
    await battlesProvider.patchBattleNotification(
      battleId: battleId,
      content: content,
      imageUrl: battleInfo.value.battleImageUrl,
    );
  }
}
